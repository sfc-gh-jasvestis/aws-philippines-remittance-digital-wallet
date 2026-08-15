# Demo Script: Digital Wallet & Payments Hub Analytics
## ~4-Minute Recorded Walkthrough
**Format**: Screen recording with voiceover
**Target**: Customer meeting / booth loop / social share
**Narrative**: "Snowflake processes digital wallet transactions from Kinesis, detects fraud patterns with ML.ANOMALY_DETECTION, classifies risk levels, and sends SNS alerts — real-time payments intelligence without external ML infrastructure"
**Demo Mode**: Open app with `?demo=true` for presenter notes

---

## Two Personas

| Persona | Role | Tool | What they care about |
|---|---|---|---|
| **Jennifer Grace Lim-Napoles** | Chief Risk Officer | React App (SPCS) | Fraud rates, transaction decline rates, AML flags, regulatory compliance |
| **Marco Antonio Pangilinan** | Payments Product Manager | Amazon QuickSight | Transaction volumes, user growth, merchant adoption, payment success rates |

---

## What's Built

| Layer | Component | Detail |
|---|---|---|
| **RAW** | 6 tables | WALLET_ACCOUNTS (4500000), TRANSACTIONS (18000000), MERCHANTS (125000), FRAUD_CASES (8500), DEVICE_SIGNALS (5000000), NETWORK_GRAPH (2200000) |
| **CURATED** | 4 Dynamic Tables | TRANSACTION_VELOCITY, MERCHANT_RISK_PROFILE, ECOSYSTEM_HEALTH, FRAUD_TIMESERIES |
| **ML** | ML.ANOMALY_DETECTION + ML.CLASSIFICATION | Forecasting + anomaly detection |
| **AI** | AI_CLASSIFY, COMPLETE | Classification + extraction |
| **Search** | Cortex Search | 8500 documents indexed |
| **Agent** | WALLET_INTELLIGENCE_AGENT | Semantic View + Search tools |


---

## The Story

Philippine digital wallets have exploded — GCash alone has 90M+ registered accounts. A growing fintech processes ₱42 billion monthly through 4.5M active wallets. But fraud is evolving: account takeovers, QR code scams, and merchant collusion cost the industry billions. Traditional batch fraud systems detect attacks hours after damage is done. Snowflake processes every transaction in real-time.

---

## Script

### [0:00–0:45] EXECUTIVE COCKPIT

**Show**: Executive Cockpit tab

> "₱42 billion in total payment volume this month — 18M transactions across 4 channels."

**Action**: Point at ₱42B TPV KPI

### [0:45–1:30] FRAUD DETECTION

**Show**: Fraud Detection tab

> "ML.ANOMALY_DETECTION flagged QR channel — fraud rate spiked 3x in last 48 hours."

**Action**: Show fraud rate timeseries with anomaly markers on QR channel

### [1:30–2:15] ECOSYSTEM HEALTH

**Show**: Ecosystem Health tab

> "Daily active transacting users: 1.2M — up 15% from last month."

**Action**: Show DAU trend chart

### [2:15–3:00] ASK AI

**Show**: Ask AI tab

> "Jennifer asks: 'What's the loss amount from confirmed fraud this month?'"

**Action**: Type: 'Fraud losses this month?'

### [3:00–3:45] ARCHITECTURE & DATA

**Show**: Architecture & Data tab

> "Kinesis → Snowpipe Streaming → ML scoring → SNS alerts — under 60 seconds end-to-end."

**Action**: Walk through architecture diagram


---

## Key Demo Differentiators

1. **ML.ANOMALY_DETECTION for fraud spikes** — Real-time fraud rate monitoring per payment channel — not batch
2. **ML.CLASSIFICATION for account-level fraud** — Native fraud scoring without SageMaker infrastructure
3. **SNS alert integration** — Sub-minute detect-to-alert pipeline for fraud events
4. **18M transaction scale** — Production-scale demo — not toy dataset
5. **Philippine digital wallet context** — GCash/Maya ecosystem with sari-sari stores, QR payments, OFW top-ups
6. **Network graph analysis for fraud rings** — Account-to-account relationships analyzed for coordinated fraud


---

## Demo Prep Checklist

### Data Verification
- [ ] `SELECT COUNT(*) FROM DIGITAL_WALLET.RAW.TRANSACTIONS` → 18000000
- [ ] `SELECT COUNT(*) FROM DIGITAL_WALLET.RAW.WALLET_ACCOUNTS` → 4500000
- [ ] `SELECT COUNT(*) FROM DIGITAL_WALLET.RAW.MERCHANTS` → 125000

### ML Model Verification
- [ ] `SELECT COUNT(*) FROM DIGITAL_WALLET.ML.FRAUD_ANOMALY_RESULTS WHERE IS_ANOMALY = TRUE` → >0
- [ ] `SELECT COUNT(*) FROM DIGITAL_WALLET.ML.FRAUD_CLASSIFICATION_RESULTS WHERE FRAUD_PROBABILITY > 0.85` → ~342

### AI/Agent Verification
- [ ] `SELECT COUNT(DISTINCT RISK_CATEGORY) FROM DIGITAL_WALLET.AI.TRANSACTION_RISK_CLASS` → >=3

