---
title: Capacity and Scale Model
chapter: 22
version: 0.1
owner: TBD
classification: Internal
last_reviewed: 2026-Q2
next_review: 2026-Q3
status: Draft
---

# 22. Capacity and Scale Model

[↑ Back to TOC](toc.md)

| Version | Owner | Classification | Last Reviewed | Next Review | Status |
|---|---|---|---|---|---|
| 0.1 | TBD | Internal | 2026-Q2 | 2026-Q3 | Draft |

> **Closes Gaps:** B3, F2.

---

## 1. Capacity Drivers
The four primary drivers of observability load:

| Driver | Symbol | Typical Range (per host monitored) |
|---|---|---|
| Active metric series | S | 10k–500k per host |
| Log volume | L | 100MB–10GB per host per day |
| Trace span rate | T | 100–10,000 spans/sec per service |
| Profile volume | P | 10MB–1GB per service per day |

For Xceedance reference scale (target end-state):
- ~200 services across ~50 hosts.
- ~3M active metric series.
- ~2TB logs/day raw → ~400GB/day after compression and structured-log policy.
- ~50k spans/sec aggregated; tail-sampled to ~5k stored.
- ~5GB profiles/day.

## 2. Reference Deployment Sizes

### 2.1 Small (single Compose host)
| Component | CPU | RAM | Disk | Sustainable Limit |
|---|---|---|---|---|
| OTel Collector (gateway) | 2 vCPU | 4 GB | 50 GB local queue | 5k spans/s, 50MB/s logs |
| Prometheus | 4 vCPU | 16 GB | 500 GB SSD | 1M active series, 30d retention |
| Loki | 2 vCPU | 8 GB | object storage | 50GB/day ingest |
| Tempo | 2 vCPU | 8 GB | object storage | 5k spans/s |
| Grafana | 1 vCPU | 2 GB | minimal | ≤ 50 concurrent users |
| Alertmanager | 0.5 vCPU | 1 GB | minimal | ≤ 1000 alert rules |
| **Host total** | **~12 vCPU** | **~40 GB** | **~600 GB SSD + object storage** | **Coverage: ≤ 30 monitored hosts; ≤ 50 services** |

### 2.2 Medium (3-host HA Compose, per [Chapter 21](21-observability-platform-ha-and-dr-design.md))
| Component | Total CPU | Total RAM | Disk | Sustainable Limit |
|---|---|---|---|---|
| OTel Collector gw × 2 | 8 vCPU | 16 GB | 200 GB | 30k spans/s, 200MB/s logs |
| Prometheus pair | 16 vCPU | 64 GB | 2 TB SSD | 5M active series, 30d retention |
| Loki pair | 8 vCPU | 32 GB | object storage | 200GB/day |
| Tempo pair | 8 vCPU | 32 GB | object storage | 30k spans/s |
| Grafana pair | 4 vCPU | 8 GB | Postgres external | ≤ 200 concurrent users |
| Alertmanager × 3 | 1.5 vCPU | 3 GB | minimal | ≤ 5000 rules |
| **Stack total** | **~45 vCPU** | **~155 GB** | **~2.2 TB SSD + object** | **Coverage: ≤ 100 monitored hosts; ≤ 200 services** |

### 2.3 Large (Distributed Backends, off Compose)
At this size, Compose is no longer the right primitive. Migrate to:
- **Mimir** (or VictoriaMetrics cluster) for metrics with object-storage backend.
- **Loki distributed** (distributor / ingester / querier components).
- **Tempo distributed** (distributor / ingester / querier / compactor).
- Container orchestration may revert to a managed service or remain Compose-per-component on dedicated hosts; decision is captured in an ADR at scale-out time.
- Coverage: ≥ 200 monitored hosts; ≥ 500 services.

## 3. Worked Sizing Examples

These three worked examples take a concrete customer profile, drive it through the formulas in Section 5, and produce a per-component sizing and cost. Inputs are explicit so a reviewer can re-run the maths. All numbers are reference figures for Azure West Europe pricing class (2026-Q1); production sizing must re-baseline against measured load (see [Chapter 27, Section 3 — NFR Register](27-observability-non-functional-requirements.md#3-nfr-register)).

### 3.1 Worked Example A — Small (single Compose host, pilot scale)

**Customer profile (inputs)**
| Input | Value |
|---|---|
| Monitored hosts | 20 |
| Services | 30 (mostly Java Spring Boot + a few Node) |
| Avg replicas per service | 2 |
| Avg metrics emitted per service | 400 (Micrometer JVM + HTTP + custom) |
| Avg label combos per metric | 4 |
| Scrape interval | 15 s |
| Raw log rate | 25 MB per host per day |
| Span rate per service | 50 spans/s peak |
| Trace sampling | head 100%, tail-sampled to 10% stored |
| Profile volume | not enabled (Phase 1) |
| Retention: metrics / logs / traces | 30 d / 30 d / 7 d |
| Concurrent Grafana users (peak) | 15 |

**Step 1 — Active metric series (S_total)**
```
S_service ≈ avg_metrics × label_combos × replicas
          ≈ 400 × 4 × 2 = 3,200 series/service
S_total   ≈ 30 services × 3,200 = 96,000 series
```
Add ~30% headroom for node-exporter, blackbox, kube-state-metrics, OTel collector internal metrics: **S_total ≈ 125k active series**.

**Step 2 — Prometheus RAM**
```
RAM ≈ active_series × 3 KB × 4 (peak multiplier)
    ≈ 125,000 × 3 KB × 4 ≈ 1.5 GB working set
```
Round up to **4 GB allocated** (leaves headroom for query bursts).

**Step 3 — Prometheus disk (30 d)**
```
Disk ≈ S × (1 / scrape_s) × 1.7 B × 86400 × 30
     ≈ 125,000 × (1/15) × 1.7 × 86400 × 30
     ≈ ~36 GB
```
Provision **100 GB SSD** (4× compaction / WAL / index headroom).

**Step 4 — Loki ingest and disk**
```
Raw_GB/day  = 20 hosts × 25 MB = 500 MB/day
Compressed  = 500 MB × 0.15    = ~75 MB/day
30 d store  = ~2.3 GB object storage
```
Loki sits idle at this scale; the 50 GB local queue on the Collector covers a 4-day outage.

**Step 5 — Tempo ingest and disk**
```
Spans/s peak = 30 services × 50 = 1,500 spans/s ingested
Stored       = 1,500 × 0.10     = 150 spans/s after tail-sampling
GB/day       = 150 × 86400 × 700 B ≈ ~9 GB/day
7 d store    = ~65 GB object storage
```

**Step 6 — Collector sizing**
At 1,500 spans/s + 500 MB/day logs + 125k series scrape proxy, a single gateway collector at **2 vCPU / 4 GB RAM** sits at <40% CPU. No replica needed for capacity; a second replica is still recommended for availability (see [Chapter 21](21-observability-platform-ha-and-dr-design.md)).

**Step 7 — Final allocation (single host)**

| Component | CPU | RAM | Disk |
|---|---|---|---|
| OTel Collector gateway | 2 vCPU | 4 GB | 50 GB (local queue) |
| Prometheus | 2 vCPU | 4 GB | 100 GB SSD |
| Loki | 1 vCPU | 4 GB | object storage (~3 GB) |
| Tempo | 1 vCPU | 4 GB | object storage (~65 GB) |
| Grafana | 1 vCPU | 2 GB | minimal |
| Alertmanager | 0.5 vCPU | 1 GB | minimal |
| Host OS + Docker + headroom | 1.5 vCPU | 5 GB | 20 GB |
| **Host total** | **~9 vCPU** | **~24 GB** | **~170 GB SSD + ~70 GB object** |

A Standard_D8s_v5 (8 vCPU / 32 GB) is the closest VM SKU; bump to **D16s_v5** if Grafana user count grows or if profile collection is enabled in Phase 2.

**Step 8 — Cost (per month, Azure WE, illustrative)**
- D16s_v5 reserved 1-yr: ~$280
- 170 GB SSD premium P10: ~$25
- 70 GB blob (cool): ~$1
- Egress (≤ 50 GB/mo): ~$5
- **Total: ~$310/month**

**Step 9 — Headroom check against scale-out triggers (Section 4)**
| Trigger | Threshold | Current | Headroom |
|---|---|---|---|
| Prometheus RAM utilisation | ≥ 70% of budget | ~38% | OK — 1.8× headroom |
| Loki ingest | ≥ 35 GB/day (70% of 50 GB) | 0.5 GB/day | OK — 70× headroom |
| Tempo ingest | ≥ 14k spans/s | 1.5k | OK — 9× headroom |
| Collector dropped spans | > 0 | 0 | OK |
| Grafana concurrent users | ≥ 40 (80% of 50) | 15 | OK — 2.6× headroom |

Verdict: Small profile is the right starting point; first scale-out trigger likely to fire is **Prometheus active series** as service count grows past ~80.

---

### 3.2 Worked Example B — Medium (3-host HA Compose)

**Customer profile (inputs)**
| Input | Value |
|---|---|
| Monitored hosts | 80 |
| Services | 150 (Java + Node + Python) |
| Avg replicas per service | 3 |
| Avg metrics per service | 500 |
| Avg label combos per metric | 5 |
| Scrape interval | 15 s |
| Raw log rate | 200 MB per host per day |
| Span rate per service | 100 spans/s peak |
| Trace sampling | head 100%, tail-sampled to 8% stored |
| Profile volume | 20 MB per service per day (pyroscope enabled, 10% of services) |
| Retention: metrics / logs / traces / profiles | 30 d / 30 d / 7 d / 14 d |
| Concurrent Grafana users (peak) | 120 |

**Step 1 — Active metric series**
```
S_service ≈ 500 × 5 × 3 = 7,500 series/service
S_total   ≈ 150 × 7,500 = 1.125M series
Headroom (30%) → ~1.46M active series
```

**Step 2 — Prometheus RAM (HA pair)**
```
RAM per replica ≈ 1.46M × 3 KB × 4 ≈ 17.5 GB
```
Allocate **24 GB per replica** (HA pair = 48 GB total).

**Step 3 — Prometheus disk (30 d, per replica)**
```
Disk ≈ 1.46M × (1/15) × 1.7 × 86400 × 30 ≈ ~430 GB
```
Provision **1 TB SSD per replica** (2 TB across the HA pair).

**Step 4 — Loki ingest and disk**
```
Raw_GB/day  = 80 × 200 MB = 16 GB/day
Compressed  = 16 × 0.15  = ~2.4 GB/day
30 d store  = ~72 GB object storage
```
Loki pair at 2 vCPU / 8 GB each handles this with >70% headroom.

**Step 5 — Tempo ingest and disk**
```
Spans/s peak = 150 × 100 = 15,000 spans/s ingested
Stored       = 15,000 × 0.08 = 1,200 spans/s after tail-sampling
GB/day       = 1,200 × 86400 × 700 B ≈ ~72 GB/day
7 d store    = ~505 GB object storage
```

**Step 6 — Profile (Pyroscope) ingest**
```
Services profiled = 150 × 0.10 = 15
Volume            = 15 × 20 MB = 300 MB/day raw
Compressed        = ~60 MB/day
14 d store        = ~0.8 GB object storage
```
Negligible; bundle pyroscope into the existing Grafana stack at 1 vCPU / 4 GB.

**Step 7 — Collector sizing**
15k spans/s + 16 GB/day logs + ~1.5M series scrape proxy → 2 gateway replicas at **4 vCPU / 8 GB each** running at ~50% CPU peak. Tail-sampling policy concentrated on the gateway tier.

**Step 8 — Final allocation (3 hosts, HA pair where applicable)**

| Component | Total CPU | Total RAM | Disk |
|---|---|---|---|
| OTel Collector gw × 2 | 8 vCPU | 16 GB | 200 GB (local queues) |
| Prometheus pair | 8 vCPU | 48 GB | 2 TB SSD |
| Loki pair | 4 vCPU | 16 GB | object storage (~72 GB) |
| Tempo pair | 4 vCPU | 16 GB | object storage (~505 GB) |
| Pyroscope | 1 vCPU | 4 GB | object storage (~1 GB) |
| Grafana pair | 4 vCPU | 8 GB | external Postgres |
| Postgres (Grafana) | 2 vCPU | 4 GB | 50 GB SSD |
| Alertmanager × 3 | 1.5 vCPU | 3 GB | minimal |
| Host OS + Docker + headroom (3 hosts) | 4.5 vCPU | 15 GB | 60 GB |
| **Stack total** | **~37 vCPU** | **~130 GB** | **~2.3 TB SSD + ~580 GB object** |

Spread across **3 × Standard_D16s_v5** (48 vCPU / 192 GB combined): ~77% CPU and ~67% RAM utilisation — within healthy band. Anti-affinity rules per [Chapter 21](21-observability-platform-ha-and-dr-design.md).

**Step 9 — Cost (per month, Azure WE, illustrative)**
- 3 × D16s_v5 reserved 1-yr: ~$840
- 2 TB SSD premium P30: ~$300
- 50 GB SSD P6 (Postgres): ~$8
- 580 GB blob (cool): ~$10
- Azure Database for PostgreSQL Flexible (Burstable B2s): ~$80
- Egress (~500 GB/mo): ~$45
- **Total: ~$1,280/month**

**Step 10 — Headroom check**
| Trigger | Threshold | Current | Headroom |
|---|---|---|---|
| Prometheus RAM | ≥ 70% of 24 GB | ~73% | **AT TRIGGER** — plan recording rules or Mimir migration within 6 months |
| Prometheus query P95 | ≥ 5 s | ~2.5 s | OK |
| Loki ingest | ≥ 140 GB/day | 2.4 GB/day | OK — 58× headroom |
| Tempo ingest | ≥ 21k spans/s | 15k | OK — 1.4× headroom (watch) |
| Collector dropped spans | > 0 | 0 | OK |
| Alertmanager rules | ≥ 5,000 | ~600 | OK |
| Grafana concurrent users | ≥ 160 | 120 | OK — 1.3× headroom (watch) |

Verdict: Medium is tight on **Prometheus RAM** and on **Tempo ingest**; two of three triggers are within 30% of firing. The migration plan to Large should start no later than the next quarterly review (see Section 4).

---

### 3.3 Worked Example C — Large (distributed backends, off Compose)

**Customer profile (inputs)**
| Input | Value |
|---|---|
| Monitored hosts | 250 |
| Services | 500 |
| Avg replicas per service | 4 |
| Avg metrics per service | 600 |
| Avg label combos per metric | 6 |
| Scrape interval | 15 s |
| Raw log rate | 500 MB per host per day |
| Span rate per service | 200 spans/s peak |
| Trace sampling | head 100%, tail-sampled to 5% stored |
| Profile volume | 30 MB per service per day (50% of services) |
| Retention: metrics / logs / traces / profiles | 30 d / 30 d / 14 d / 14 d |
| Concurrent Grafana users (peak) | 400 |

**Step 1 — Active metric series**
```
S_service ≈ 600 × 6 × 4 = 14,400 series/service
S_total   ≈ 500 × 14,400 = 7.2M series
Headroom (30%) → ~9.4M active series
```
This exceeds the medium-Prometheus limit by ~6×; **Mimir (or VictoriaMetrics cluster) is required**.

**Step 2 — Mimir sizing (three-zone)**
Mimir reference at this scale (per upstream sizing guide and our internal benchmarks):
- Ingester: 1 replica per ~1M series, 3 zones → 3 × 4 = **12 ingester replicas** at 4 vCPU / 16 GB / 100 GB SSD each
- Distributor: handles ~250k samples/s per replica; total ~620k samples/s → **3 distributor replicas** at 2 vCPU / 4 GB
- Querier: **6 replicas** at 4 vCPU / 16 GB
- Query-frontend + query-scheduler: **2 + 2 replicas** at 2 vCPU / 4 GB each
- Compactor: **2 replicas** at 2 vCPU / 8 GB / 200 GB SSD
- Store-gateway: **3 replicas** at 2 vCPU / 8 GB / 200 GB SSD (index cache)
- Object storage (blocks): ~9.4M × (1/15) × 1.7 × 86400 × 30 ≈ **~2.8 TB** for 30 d

**Step 3 — Loki distributed**
```
Raw_GB/day  = 250 × 500 MB = 125 GB/day
Compressed  = 125 × 0.15  = ~19 GB/day
30 d store  = ~560 GB object storage
```
- Distributor: 3 replicas × 2 vCPU / 4 GB
- Ingester: 6 replicas × 4 vCPU / 16 GB / 100 GB SSD (WAL)
- Querier: 4 replicas × 4 vCPU / 8 GB
- Query-frontend: 2 replicas × 2 vCPU / 4 GB
- Compactor: 1 replica × 2 vCPU / 8 GB

**Step 4 — Tempo distributed**
```
Spans/s peak = 500 × 200 = 100,000 spans/s ingested
Stored       = 100,000 × 0.05 = 5,000 spans/s after tail-sampling
GB/day       = 5,000 × 86400 × 700 B ≈ ~300 GB/day
14 d store   = ~4.2 TB object storage
```
- Distributor: 4 replicas × 2 vCPU / 4 GB
- Ingester: 8 replicas × 4 vCPU / 16 GB / 100 GB SSD (WAL)
- Querier: 4 replicas × 4 vCPU / 8 GB
- Query-frontend: 2 replicas × 2 vCPU / 4 GB
- Compactor: 2 replicas × 2 vCPU / 8 GB

**Step 5 — Pyroscope**
```
Services profiled = 500 × 0.5 = 250
Volume            = 250 × 30 MB = 7.5 GB/day raw
Compressed        = ~1.5 GB/day
14 d store        = ~21 GB object storage
```
- Ingester: 3 replicas × 2 vCPU / 8 GB
- Querier: 2 replicas × 2 vCPU / 4 GB

**Step 6 — Collector tier**
Span throughput 100k/s + log throughput 125 GB/day at the gateway requires:
- Gateway tier: **8 replicas** × 4 vCPU / 8 GB (horizontal-scaled behind L4 LB)
- Agent tier: DaemonSet per host (existing)

**Step 7 — Grafana**
400 concurrent users → **4 Grafana replicas** × 4 vCPU / 8 GB behind L7 LB; external Postgres on managed service (4 vCPU / 16 GB / 200 GB).

**Step 8 — Final allocation summary**

| Tier | Replicas | Total CPU | Total RAM | Total Disk |
|---|---|---|---|---|
| Mimir (all components) | 28 | ~88 vCPU | ~320 GB | ~1.6 TB SSD (local) + ~2.8 TB object |
| Loki distributed | 16 | ~50 vCPU | ~140 GB | ~600 GB SSD (local) + ~560 GB object |
| Tempo distributed | 20 | ~62 vCPU | ~180 GB | ~800 GB SSD (local) + ~4.2 TB object |
| Pyroscope | 5 | ~10 vCPU | ~32 GB | ~21 GB object |
| OTel Collector gateways | 8 | ~32 vCPU | ~64 GB | ~400 GB (local queues) |
| Grafana + Postgres | 5 | ~20 vCPU | ~48 GB | ~200 GB SSD |
| Alertmanager × 5 | 5 | ~3 vCPU | ~5 GB | minimal |
| **Stack total** | **87** | **~265 vCPU** | **~790 GB** | **~3.6 TB SSD + ~7.6 TB object** |

At this scale, **Kubernetes (AKS) is the right orchestrator**, not Compose. The migration from Compose to AKS is the dominant change captured by ADR-008 (see [Chapter 16, Section 4 — ADR Bodies (Full Records)](16-observability-adr-decision-register.md#4-adr-bodies-full-records)). Node pool: **8 × Standard_D32s_v5** (256 vCPU / 1,024 GB combined) gives ~3.3× CPU and 1.3× RAM headroom; plus dedicated storage-class for ingester local SSDs.

**Step 9 — Cost (per month, Azure WE, illustrative)**
- 8 × D32s_v5 reserved 1-yr (AKS node pool): ~$4,500
- AKS control plane (Standard tier): ~$73
- 3.6 TB premium SSD P30: ~$540
- 7.6 TB blob (cool): ~$130
- 200 GB SSD P10 (Postgres data): ~$30
- Azure Database for PostgreSQL Flexible (GP, D4s_v3): ~$320
- L7 LB (Application Gateway WAF_v2): ~$280
- Egress (~5 TB/mo): ~$450
- Monitoring of monitoring (Azure Monitor for AKS): ~$120
- **Total: ~$6,440/month**

**Step 10 — Headroom check**
| Trigger | Threshold | Current | Headroom |
|---|---|---|---|
| Mimir ingester memory per zone | ≥ 70% of 16 GB | ~55% | OK — 1.27× headroom |
| Mimir query P95 | ≥ 5 s | ~3 s | OK |
| Loki ingester ingest | ≥ 70% of 50 GB/day per ingester | ~21 GB/day per ingester | OK — 1.6× headroom |
| Tempo distributor accept rate | ≥ 80k spans/s | 100k | **AT TRIGGER** — verify auto-scaling on distributor tier |
| Collector dropped spans | > 0 | 0 | OK |
| Grafana concurrent users | ≥ 320 (80% of 400) | 400 | **AT TRIGGER** — plan replica increase |

Verdict: Large profile fits the customer with headroom on metrics and logs, but **Tempo distributor capacity** and **Grafana concurrent users** are at trigger. Action items recorded against ADR-008.

---

### 3.4 Cross-Example Comparison

| Dimension | Small (Ex. A) | Medium (Ex. B) | Large (Ex. C) |
|---|---|---|---|
| Hosts / services | 20 / 30 | 80 / 150 | 250 / 500 |
| Active metric series | 125k | 1.46M | 9.4M |
| Span ingest rate | 1.5k/s | 15k/s | 100k/s |
| Logs (raw) | 0.5 GB/day | 16 GB/day | 125 GB/day |
| Compute (vCPU) | ~9 | ~37 | ~265 |
| Compute (RAM) | ~24 GB | ~130 GB | ~790 GB |
| Storage (SSD + object) | ~240 GB | ~2.9 TB | ~11.2 TB |
| Orchestrator | Compose, single host | Compose, 3 hosts | AKS, 8 nodes |
| Cost / month (Azure WE) | ~$310 | ~$1,280 | ~$6,440 |
| Cost per active series (per month) | $0.0025 | $0.00088 | $0.00069 |
| Cost per span stored (per month, 7–14 d ret) | n/a | n/a | n/a — see [Chapter 9](09-observability-finops-standard.md) |

The unit economic of cost-per-active-series falls ~3.6× from Small to Large; this is the primary FinOps argument for consolidating multiple small estates onto a shared Large platform once the operational complexity is justified (see [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md)).

## 4. Scale-Out Triggers
| Indicator | Threshold | Action |
|---|---|---|
| Prometheus active series | ≥ 70% of host memory budget | Add second Prometheus, shard by job/service; or migrate to Mimir |
| Prometheus query P95 | ≥ 5s | Add query frontend, recording rules, or migrate to Mimir |
| Loki ingest rate | ≥ 70% of single-instance limit (~50GB/day) | Migrate to Loki SSD/distributed |
| Loki query timeouts | ≥ 5% of queries | Migrate to distributed; review label cardinality |
| Tempo ingest | ≥ 20k spans/s | Migrate to distributed |
| OTel Collector dropped spans | > 0 over 5 min | Add gateway replicas; review tail-sampling policy |
| Alertmanager rule count | ≥ 5000 | Shard by team; review consolidation |
| Grafana concurrent users | ≥ 80% of HA capacity | Add Grafana replicas; review heavy queries |

## 5. Sizing Calculator (heuristic)

**Active metric series:**
```
S_total ≈ Σ_services (avg_metrics_per_service × cardinality_per_metric × instances)
```
Reference: a typical Java service with Micrometer emits ~500 metrics × ~5 label combos × 4 replicas ≈ 10k series.

**Prometheus RAM:**
```
RAM ≈ (active_series × ~3 KB) + headroom
```
1M series ≈ 3 GB working set; allow 4× for query and ingestion peaks → 12 GB.

**Prometheus disk (30d retention):**
```
Disk ≈ active_series × samples_per_second × bytes_per_sample × seconds
     ≈ active_series × 1/15 × 1.7 × 86400 × 30  (default 15s scrape, ~1.7 bytes/sample compressed)
```
1M series × 30d ≈ ~290 GB; size for 500 GB.

**Loki disk (object storage):**
```
GB/day ≈ raw_log_GB/day × compression_ratio (~0.15 for structured JSON gzip)
```
2TB/day raw → ~300GB/day compressed; 30d retention → ~9TB object storage.

**Tempo disk (object storage):**
```
GB/day ≈ stored_spans/day × ~700 bytes/span (post-sampling)
```
5k spans/s × 86400 × 700 ≈ ~300 GB/day; 7d retention → ~2.1 TB.

## 6. Cost Projection (illustrative, Azure pricing class)
| Size | Compute (per month) | Object storage (per month) | Postgres (per month) | Total / month |
|---|---|---|---|---|
| Small (1 host) | ~$300 | ~$50 | $0 | ~$350 |
| Medium (3 host HA) | ~$1,200 | ~$300 | ~$150 | ~$1,650 |
| Large (distributed) | ~$5,000+ | ~$1,500+ | ~$300 | ~$7,000+ |

(Numbers are illustrative; actual figures must be modelled in [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md).)

## 7. Performance SLOs for the Platform Itself
| Platform SLI | Target |
|---|---|
| OTel Collector ingest success rate | ≥ 99.9% |
| Prometheus scrape success rate | ≥ 99.9% per target |
| Loki ingest acknowledgement P95 | ≤ 1 s |
| Tempo trace-write acknowledgement P95 | ≤ 2 s |
| Grafana dashboard load P95 | ≤ 3 s |
| Alert latency (firing → notification) P95 | ≤ 90 s |

## 8. Cardinality Budget
Cardinality is a budget. Per-service quotas:
| Tier | Max Active Series per Service | Max Distinct Label Combos per Metric |
|---|---|---|
| T1 | 50,000 | 1,000 |
| T2 | 20,000 | 500 |
| T3 | 10,000 | 200 |
| T4 | 5,000 | 100 |

Enforcement is described in [Chapter 1 Section 3.1. Cardinality Governance](01-enterprise-observability-standards-catalog.md#31-cardinality-governance).

## 9. Cross-References
- [Chapter 2. Observability Reference Architecture](02-observability-reference-architecture.md)
- [Chapter 7. IaC for Observability Standard](07-iac-for-observability-standard.md) — Compose configurations sized to these reference deployments.
- [Chapter 9. Observability FinOps Standard](09-observability-finops-standard.md) — cost modelling and unit economics.
- [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) — HA topology overlaid on these sizes.

---

[↑ Back to TOC](toc.md)
