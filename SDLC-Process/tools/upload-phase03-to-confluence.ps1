param(
    [string]$WorkspaceRoot = ".",
    [switch]$VerifyOnly
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Get-ConfigMap {
    param([string]$ConfigPath)

    $map = @{}
    foreach ($line in Get-Content -LiteralPath $ConfigPath) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        if ($line -match '^(?<key>[A-Z0-9_]+)\s*-\s*(?<value>.+)$') {
            $map[$matches['key']] = $matches['value'].Trim()
            continue
        }
        if ($line -match '^(?<key>[A-Z0-9_]+)=(?<value>.+)$') {
            $map[$matches['key']] = $matches['value'].Trim()
        }
    }

    return $map
}

function New-ConfluenceHeaders {
    param([hashtable]$Config)

    $pair = '{0}:{1}' -f $Config['ATLASSIAN_EMAIL'], $Config['ATLASSIAN_API_TOKEN']
    $basic = [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($pair))
    return @{
        Authorization = "Basic $basic"
        Accept = 'application/json'
        'Content-Type' = 'application/json'
    }
}

function Invoke-Confluence {
    param(
        [string]$Method,
        [string]$Uri,
        [hashtable]$Headers,
        [object]$Body
    )

    if ($null -ne $Body) {
        $json = $Body | ConvertTo-Json -Depth 100
        return Invoke-RestMethod -Method $Method -Uri $Uri -Headers $Headers -Body $json
    }

    return Invoke-RestMethod -Method $Method -Uri $Uri -Headers $Headers
}

function Normalize-LinkPath {
    param([string]$Path)

    $normalized = $Path.Trim()
    $normalized = $normalized.Replace('/', '\')
    $normalized = $normalized -replace '^\.\\', ''
    return $normalized
}

function Get-OrderMap {
    param([string]$OrderPath)

    $map = @{}
    $lines = Get-Content -LiteralPath $OrderPath | Select-Object -Skip 1
    foreach ($line in $lines) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        $parts = $line.Split('|') | ForEach-Object { $_.Trim() }
        if ($parts.Count -lt 2) { continue }
        $map[$parts[0]] = $parts[1]
    }
    return $map
}

function Build-LinkMap {
    param([hashtable]$OrderMap, [string]$BaseUrl)

    $linkMap = @{}
    foreach ($entry in $OrderMap.GetEnumerator()) {
        $fileName = '{0}.md' -f $entry.Key
        $url = '{0}/spaces/METH/pages/{1}' -f $BaseUrl, $entry.Value
        $linkMap[(Normalize-LinkPath $fileName)] = $url
    }

    $linkMap[(Normalize-LinkPath '..\02-Architecture-Design\Step-18-Threat-Modeling-Architecture-Review.md')] = '{0}/spaces/METH/pages/5918818343' -f $BaseUrl
    $linkMap[(Normalize-LinkPath '..\04-Secure-Govern-Validate\Step-32-Code-Test-Creator.md')] = '{0}/spaces/METH/pages/5924945954' -f $BaseUrl

    return $linkMap
}

function Get-MarkdownLinks {
    param([string]$Markdown)

    $matches = [System.Text.RegularExpressions.Regex]::Matches($Markdown, '\[[^\]]+\]\((?<path>[^)#]+\.md)(?<anchor>#[^)]+)?\)')
    $results = @()
    foreach ($match in $matches) {
        $results += [pscustomobject]@{
            FullMatch = $match.Value
            Path = $match.Groups['path'].Value
            Anchor = $match.Groups['anchor'].Value
        }
    }
    return $results
}

function Replace-MarkdownLinks {
    param(
        [string]$Markdown,
        [hashtable]$LinkMap
    )

    $missing = New-Object System.Collections.Generic.List[string]
    $replaced = [System.Text.RegularExpressions.Regex]::Replace(
        $Markdown,
        '\[(?<text>[^\]]+)\]\((?<path>[^)#]+\.md)(?<anchor>#[^)]+)?\)',
        {
            param($match)
            $path = Normalize-LinkPath $match.Groups['path'].Value
            $anchor = $match.Groups['anchor'].Value
            if (-not $LinkMap.ContainsKey($path)) {
                $missing.Add($path)
                return $match.Value
            }

            $target = $LinkMap[$path]
            if (-not [string]::IsNullOrWhiteSpace($anchor)) {
                $target = '{0}{1}' -f $target, $anchor
            }

            return '[{0}]({1})' -f $match.Groups['text'].Value, $target
        }
    )

    return [pscustomobject]@{
        Markdown = $replaced
        Missing = @($missing | Select-Object -Unique)
    }
}

function Convert-MarkdownToStorage {
    param(
        [string]$Markdown,
        [string]$BaseUrl,
        [hashtable]$Headers
    )

    $body = @{
        value = $Markdown
        representation = 'markdown'
    }

    $response = Invoke-Confluence -Method Post -Uri "$BaseUrl/rest/api/contentbody/convert/storage" -Headers $Headers -Body $body
    return $response.value
}

function Get-PageMetadata {
    param(
        [string]$PageId,
        [string]$BaseUrl,
        [hashtable]$Headers,
        [string]$Expand = 'version,title'
    )

    return Invoke-Confluence -Method Get -Uri "$BaseUrl/rest/api/content/${PageId}?expand=$Expand" -Headers $Headers -Body $null
}

function Update-ConfluencePage {
    param(
        [string]$PageId,
        [string]$Title,
        [int]$CurrentVersion,
        [string]$StorageValue,
        [string]$BaseUrl,
        [hashtable]$Headers
    )

    $body = @{
        id = $PageId
        type = 'page'
        title = $Title
        version = @{ number = ($CurrentVersion + 1) }
        body = @{
            storage = @{
                value = $StorageValue
                representation = 'storage'
            }
        }
    }

    return Invoke-Confluence -Method Put -Uri "$BaseUrl/rest/api/content/${PageId}" -Headers $Headers -Body $body
}

function Verify-PageLinks {
    param(
        [string]$PageId,
        [string[]]$ExpectedUrls,
        [string]$BaseUrl,
        [hashtable]$Headers
    )

    $page = Get-PageMetadata -PageId $PageId -BaseUrl $BaseUrl -Headers $Headers -Expand 'version,body.storage'
    $body = $page.body.storage.value
    $missing = @()
    foreach ($url in ($ExpectedUrls | Select-Object -Unique)) {
        if ($body -notlike "*$url*") {
            $missing += $url
        }
    }

    return [pscustomobject]@{
        PageId = $PageId
        Version = $page.version.number
        MissingUrls = $missing
    }
}

$root = (Resolve-Path -LiteralPath $WorkspaceRoot).Path
$config = Get-ConfigMap -ConfigPath (Join-Path $root '.config')
$headers = New-ConfluenceHeaders -Config $config
$baseUrl = $config['CONFLUENCE_BASE_URL']

$finalDir = Join-Path $root '03-Develop-Final'
$orderMap = Get-OrderMap -OrderPath (Join-Path $finalDir '.order')
$linkMap = Build-LinkMap -OrderMap $orderMap -BaseUrl $baseUrl

$results = @()

foreach ($entry in $orderMap.GetEnumerator() | Sort-Object Name) {
    $fileBase = $entry.Key
    $pageId = $entry.Value
    $filePath = Join-Path $finalDir ($fileBase + '.md')

    $rawMarkdown = Get-Content -LiteralPath $filePath -Raw
    $replacement = Replace-MarkdownLinks -Markdown $rawMarkdown -LinkMap $linkMap
    if ($replacement.Missing.Count -gt 0) {
        throw "Unresolved markdown links in ${fileBase}: $($replacement.Missing -join ', ')"
    }

    $expectedUrls = @(Get-MarkdownLinks -Markdown $replacement.Markdown | ForEach-Object {
        $normalized = Normalize-LinkPath $_.Path
        if ($linkMap.ContainsKey($normalized)) {
            $url = $linkMap[$normalized]
            if (-not [string]::IsNullOrWhiteSpace($_.Anchor)) {
                '{0}{1}' -f $url, $_.Anchor
            } else {
                $url
            }
        }
    } | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })

    $pageMeta = Get-PageMetadata -PageId $pageId -BaseUrl $baseUrl -Headers $headers
    $storageValue = Convert-MarkdownToStorage -Markdown $replacement.Markdown -BaseUrl $baseUrl -Headers $headers

    if (-not $VerifyOnly) {
        [void](Update-ConfluencePage -PageId $pageId -Title $pageMeta.title -CurrentVersion $pageMeta.version.number -StorageValue $storageValue -BaseUrl $baseUrl -Headers $headers)
    }

    $verification = Verify-PageLinks -PageId $pageId -ExpectedUrls $expectedUrls -BaseUrl $baseUrl -Headers $headers
    $results += [pscustomobject]@{
        File = $fileBase
        PageId = $pageId
        VerifiedVersion = $verification.Version
        MissingUrls = ($verification.MissingUrls -join '; ')
    }
}

$results | Format-Table -AutoSize
