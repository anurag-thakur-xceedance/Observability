---
title: Observability Platform HA and DR Design
chapter: 22
version: 0.1
owner: TBD
classification: Internal
reviewed_date:
status: Draft
---

# 22. Observability Platform HA and DR Design

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](21-business-capability-and-value-stream-mapping.md) | [Next Page](23-capacity-and-scale-model.md)

| **Document Owner** | CoE-Architecture |
| --- | --- |
| **Approved By** | Simon Armstrong (pending wider review) |
| **Classification** | Internal |
| **Review Frequency** | Quarterly |
| **First Review** | 1-Aug-2026 |
| **Next Review Due** | 1-Nov-2026 |

---

## 22.1 HA / DR Posture
The platform itself is **Tier 1**. Recovery objectives:
- **RTO:** ≤ 30 minutes (faster than business Tier 1 RTO of 60 min, so platform is back before business systems need it).
- **RPO:** ≤ 5 minutes for metrics/traces/logs in flight; ≤ 1 hour for dashboards/alert-rule state (recoverable from Git).
- **Self-monitoring:** A meta-monitor (lightweight Prometheus + Alertmanager) monitors the primary observability platform.

## 22.2 Component HA Matrix

| Component | Single-Host Compose Limit | HA Pattern | Scale-Out Target | When to Migrate |
|---|---|---|---|---|
| OTel Collector (edge) | Per-host agent; failure isolated | Run as resilient host service (`restart: always`); local disk queue with `file_storage` extension | Daemon-set equivalent across hosts | N/A — already distributed |
| OTel Collector (gateway) | Single instance bottleneck at ~100k spans/s | Active-active behind L4 LB (HAProxy / nginx) with `loadbalancing` exporter for trace stickiness | 2-N gateway replicas | When ingest > 50k spans/s sustained or single-host CPU > 60% |
| Prometheus | Single binary; no native HA | **Pair pattern:** two identical Prometheus instances scraping same targets; Grafana queries both via `--query.lookback-delta` and round-robin | Mimir / Thanos / VictoriaMetrics with object-storage backend | When series count > 10M, retention > 90 days, or HA writes needed |
| Loki | Monolithic mode supported to ~100 GB/day compressed ingest | Two monolithic instances behind LB with shared object storage (Azure Blob / S3 / MinIO) | Loki SSD or microservice mode | When ingest > 50 GB/day sustained or query latency P95 > 5 s |
| Tempo | Monolithic mode supported to ~20k spans/s sustained ingest | Two instances with shared object storage backend | Tempo distributed (distributor / ingester / querier) | When trace ingest > 20k spans/s sustained or query timeout rate > 1% |
| Grafana | Single instance + SQLite is single point of failure | External Postgres for Grafana DB; two Grafana instances behind LB; provisioned dashboards/datasources from Git | Grafana HA with shared external DB | Day 1 if RTO ≤ 30 min |
| Alertmanager | Single instance ≠ HA | **Cluster mode:** 3 Alertmanager peers gossiping; deduplicates alerts | Already HA in cluster mode | Day 1 |
| Pyroscope (profiles) | Single instance supported to ~1 GB/day ingest | Two instances with shared object storage | Pyroscope distributed | When profile ingest > 1 GB/day sustained |

## 22.3 Reference HA Topology (Compose, Single Region)
```
                           ┌─────────────────────┐
                           │   L4/L7 Load Bal.   │  ← HAProxy / nginx / Azure LB
                           └──────────┬──────────┘
                                      │
                  ┌───────────────────┼───────────────────┐
                  │                   │                   │
        ┌─────────▼────────┐ ┌────────▼────────┐ ┌────────▼────────┐
        │ Compose host A   │ │ Compose host B  │ │ Compose host C  │
        │  (active)        │ │  (active)       │ │  (alertmgr only)│
        ├──────────────────┤ ├─────────────────┤ ├─────────────────┤
        │ OTel-gw          │ │ OTel-gw         │ │ Alertmanager-3  │
        │ Prometheus-A     │ │ Prometheus-B    │ │                 │
        │ Loki-A           │ │ Loki-B          │ │                 │
        │ Tempo-A          │ │ Tempo-B         │ │                 │
        │ Grafana-A        │ │ Grafana-B       │ │                 │
        │ Alertmanager-1   │ │ Alertmanager-2  │ │                 │
        └────────┬─────────┘ └────────┬────────┘ └─────────────────┘
                 │                    │
                 └───────┬────────────┘
                         │ (shared object storage)
                  ┌──────▼─────────────┐
                  │  Azure Blob / S3   │  ← Loki + Tempo chunks; Prometheus
                  │  / MinIO           │     remote-write target (long-term)
                  └────────────────────┘
                  ┌────────────────────┐
                  │ Postgres (HA)      │  ← Grafana DB
                  └────────────────────┘
```

## 22.4 Persistence and Backup
| Asset | Source of Truth | Backup Mechanism | Restore Time | Test Cadence |
|---|---|---|---|---|
| Dashboards | Git repo (`grafana/dashboards/`) | Git + provisioning | < 5 min via re-provision | Quarterly |
| Datasources | Git repo (`grafana/datasources.yml`) | Git + provisioning | < 5 min | Quarterly |
| Alert rules | Git repo (`prometheus/rules/`, `alertmanager/`) | Git + reload | < 5 min | Quarterly |
| Prometheus TSDB | Local volume per host | Snapshot to object storage every 1h via `promtool tsdb snapshot` | ≤ 30 min for last-hour data; longer history from remote-write target | Monthly |
| Loki chunks | Object storage (Azure Blob / S3) | Object-storage versioning + lifecycle | RPO ≤ 5 min | Monthly restore drill |
| Tempo blocks | Object storage | As above | As above | Monthly restore drill |
| Grafana DB (Postgres) | Postgres | Logical backup (`pg_dump`) every 6h + WAL archive | ≤ 15 min | Monthly |
| OTel Collector queue | Local disk (`file_storage` extension) | Implicit; survives restart; lost on host loss | N/A | N/A |

## 22.5 DR Patterns

### 22.5.1 Pattern A — Hot/Warm Cross-Region (recommended for Tier 1)
- Primary region: full observability deployment stack as in Section 4.
- DR region: lightweight deployment stack (single host or minimal footprint per component) with object storage replicated cross-region.
- Prometheus remote-write to a regional Mimir / VictoriaMetrics with cross-region replication.
- DR Grafana provisioned identically; DNS / LB cutover for failover.
- **RTO ≤ 30 min, RPO ≤ 5 min.**

### 22.5.2 Pattern B — Cold-Backup
- Object-storage replication cross-region (Azure GRS / S3 cross-region replication).
- DR site provisioned on demand from approved IaC automation in [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md).
- **RTO ≤ 4 h, RPO ≤ 1 h.** Acceptable for non-customer-facing observability tiers only.

### 22.5.3 Pattern C — Customer-Site Local DR
- Each customer site runs its own observability deployment stack (see [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md)).
- DR is local snapshot + remote-write to central Xceedance aggregation (after PII redaction per [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md)).

## 22.6 Failure Modes and Mitigations
| Failure | Detection | Mitigation | Owner |
|---|---|---|---|
| Single host loss | LB health check; meta-monitor alert | Other Compose host serves traffic; restore failed host from IaC | Platform Engineering |
| Prometheus crash / OOM | Meta-monitor `up` check on Prometheus; Alertmanager-1 fires | Pair instance continues; restart via Compose `restart: always` | Platform Engineering |
| Object-storage outage | Loki/Tempo write errors; meta-monitor | Local buffer in OTel Collector + Prometheus remote-write retry; degrade to short-term query only | Platform Engineering |
| Alert storm (>100 alerts/min) | Alertmanager rate; meta-monitor | Inhibition rules; severity downgrade; emergency silence policy in [Chapter 5. Alerting and Incident Severity Policy](05-alerting-and-incident-severity-policy.md) | On-call |
| Cardinality explosion | Series-count rule on Prometheus; meta-monitor | Auto-drop labels via `metric_relabel_configs`; emergency block list | Platform Engineering |
| Grafana DB corruption | Liveness probe failure | Restore from Postgres backup; provision dashboards from Git | Platform Engineering |
| Region outage | Health-check failure across all primary endpoints | DNS / LB cutover to DR region (Pattern A) | Platform Engineering + Network |
| OTel Collector queue full | Collector self-metric `otelcol_processor_dropped_spans` | Spill to disk via `file_storage`; backpressure to clients; scale gateway | Platform Engineering |

## 22.7 Self-Monitoring (Meta-Monitor)
A separate, deliberately small Prometheus + Alertmanager pair runs on a different host class (or a different cloud account / region) and:
- Scrapes the primary stack's `/metrics` endpoints.
- Fires on `up == 0`, scrape failures, ingest-rate drops > 30%, queue saturation, cardinality growth.
- Pages observability on-call directly (bypassing the primary Alertmanager that is being monitored).

## 22.8 DR Drill Cadence
| Drill | Frequency | Success Criteria |
|---|---|---|
| Dashboard re-provision | Quarterly | All dashboards restored from Git ≤ 5 min |
| Alert-rule reload | Quarterly | All rules reloaded ≤ 5 min |
| Object-storage restore | Monthly | Sample chunks restored, queryable in Loki/Tempo |
| Grafana DB restore | Monthly | Restored Grafana operational ≤ 15 min |
| Prometheus pair failover | Quarterly | Lookback-delta failover proven seamless to Grafana |
| Region failover (Pattern A) | Semi-annually | RTO ≤ 30 min, RPO ≤ 5 min, no data loss in critical signals |
| Cold-backup spin-up (Pattern B) | Annually | Stack reachable ≤ 4 h |

## 22.9 Cross-References
- [Chapter 3. Observability Reference Architecture](03-observability-reference-architecture.md) — base architecture.
- [Chapter 8. IaC for Observability Standard](08-iac-for-observability-standard.md) — deployment provisioning and automation.
- [Chapter 23. Capacity and Scale Model](23-capacity-and-scale-model.md) — when to migrate from Compose to distributed.
- [Chapter 24. Observability Platform Security Architecture](24-observability-platform-security-architecture.md) — auth & encryption between HA peers.
- [Chapter 27. Multi-Tenant and Customer-Site Deployment Model](27-multi-tenant-and-customer-site-deployment-model.md) — customer-site DR patterns.

---

[Home Page](01-xceedance-observability-strategy.md) | [Previous Page](21-business-capability-and-value-stream-mapping.md) | [Next Page](23-capacity-and-scale-model.md)
