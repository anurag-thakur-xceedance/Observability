# 22. Capacity and Scale Model

[↑ Back to TOC](toc.md)

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

## 3. Scale-Out Triggers
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

## 4. Sizing Calculator (heuristic)

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

## 5. Cost Projection (illustrative, Azure pricing class)
| Size | Compute (per month) | Object storage (per month) | Postgres (per month) | Total / month |
|---|---|---|---|---|
| Small (1 host) | ~$300 | ~$50 | $0 | ~$350 |
| Medium (3 host HA) | ~$1,200 | ~$300 | ~$150 | ~$1,650 |
| Large (distributed) | ~$5,000+ | ~$1,500+ | ~$300 | ~$7,000+ |

(Numbers are illustrative; actual figures must be modelled in [Chapter 9. Observability FinOps Standard](9-observability-finops-standard.md).)

## 6. Performance SLOs for the Platform Itself
| Platform SLI | Target |
|---|---|
| OTel Collector ingest success rate | ≥ 99.9% |
| Prometheus scrape success rate | ≥ 99.9% per target |
| Loki ingest acknowledgement P95 | ≤ 1 s |
| Tempo trace-write acknowledgement P95 | ≤ 2 s |
| Grafana dashboard load P95 | ≤ 3 s |
| Alert latency (firing → notification) P95 | ≤ 90 s |

## 7. Cardinality Budget
Cardinality is a budget. Per-service quotas:
| Tier | Max Active Series per Service | Max Distinct Label Combos per Metric |
|---|---|---|
| T1 | 50,000 | 1,000 |
| T2 | 20,000 | 500 |
| T3 | 10,000 | 200 |
| T4 | 5,000 | 100 |

Enforcement is described in [Chapter 1 Section 3.1. Cardinality Governance](1-enterprise-observability-standards-catalog.md#31-cardinality-governance).

## 8. Cross-References
- [Chapter 2. Observability Reference Architecture](2-observability-reference-architecture.md)
- [Chapter 7. IaC for Observability Standard](7-iac-for-observability-standard.md) — Compose configurations sized to these reference deployments.
- [Chapter 9. Observability FinOps Standard](9-observability-finops-standard.md) — cost modelling and unit economics.
- [Chapter 21. Observability Platform HA and DR Design](21-observability-platform-ha-and-dr-design.md) — HA topology overlaid on these sizes.

---

[↑ Back to TOC](toc.md)
