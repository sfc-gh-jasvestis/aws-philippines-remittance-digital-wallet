# Digital Wallet & Payments Hub Analytics

**Philippines - Remittances & Fintech**
Use case: Digital Wallet Analytics

> GCash and Maya have 90M+ accounts — Snowflake detects payment fraud in real-time with anomaly detection, monitors wallet ecosystem health, and alerts on suspicious patterns before losses materialize.

## Why Snowflake

Snowflake processes digital wallet transactions from Kinesis, detects fraud patterns with ML.ANOMALY_DETECTION, classifies risk levels, and sends SNS alerts — real-time payments intelligence without external ML infrastructure

- **ML.ANOMALY_DETECTION for fraud spikes** - Real-time fraud rate monitoring per payment channel — not batch
- **ML.CLASSIFICATION for account-level fraud** - Native fraud scoring without SageMaker infrastructure
- **SNS alert integration** - Sub-minute detect-to-alert pipeline for fraud events
- **18M transaction scale** - Production-scale demo — not toy dataset
- **Philippine digital wallet context** - GCash/Maya ecosystem with sari-sari stores, QR payments, OFW top-ups
- **Network graph analysis for fraud rings** - Account-to-account relationships analyzed for coordinated fraud

## What is deployed

| | |
|---|---|
| Database | `PH_REMITTANCE_DIGITAL_WALLET` |
| Service | `PH_REMITTANCE_DIGITAL_WALLET_APP` |
| Compute pool | `SEA_DEMOS_PHILIPPINES_POOL` |
| Dimension table | `RAW.FRAUD_CASES` (20 rows) |
| Fact table | `RAW.TRANSACTIONS` (250,000 rows, 90 days) |
| Curated layer | `CURATED.PERFORMANCE_SUMMARY`, `CURATED.TREND_ANALYSIS`, `CURATED.KPI_SUMMARY` |
| Currency | PHP (₱) |

Regions in play: Metro Manila, Cebu, Davao, Pampanga, Iloilo
Segments: Cash In, Bills Payment, P2P Transfer, QR Merchant

Dynamic tables are created suspended and refreshed on demand:

```bash
./refresh_demo_data.sh PH_REMITTANCE_DIGITAL_WALLET
```

## KPI cards

Every card below is served live from `CURATED.KPI_SUMMARY`. The app keeps the
original literal as a fallback, so it still renders if Snowflake is unreachable.

| Card | Value | Backed by |
|---|---|---|
| Wallet Users | `14.2M` | total across Fraud Cases |
| Monthly Active | `8.7M` | total across Fraud Cases |
| Avg Balance | `₱4,200` | average per event |
| Transactions (MTD) | `42M` | total across Fraud Cases |
| P2P Transfers | `₱84B` | total across Fraud Cases |
| Bill Payments | `₱24B` | total across Fraud Cases |
| Merchant Spend | `₱18B` | total across Fraud Cases |


## Demo flow

1. Executive Cockpit
2. Fraud Detection
3. Ecosystem Health
4. Ask AI
5. Architecture & Data

## Talking points

- **₱42B** - monthly total payment volume
- **18M transactions** - processed monthly across 4 channels
- **0.047%** - current fraud rate (approaching 0.05% threshold)
- **342 accounts** - flagged as high fraud probability this week
- **4.5M** - active wallet accounts
- **125,000 merchants** - onboarded (42% sari-sari stores)

## Business impact

- Philippine digital payments reached ₱8.7 trillion in 2023 — 52.8% of total retail payments (BSP)
- GCash reached 94M registered users in Philippines by end of 2023 (Globe Fintech)
- Digital payment fraud losses in APAC grew 28% in 2023 to $4.2B (LexisNexis Risk)
- Real-time fraud detection reduces losses by 50-70% vs batch processing (McKinsey Payments)

---
Generated from `generator/demo_specs/aws-philippines-remittance-digital-wallet.json`. Do not hand-edit: run
`python3 generator/gen_repo_docs.py aws-philippines-remittance-digital-wallet` instead.
