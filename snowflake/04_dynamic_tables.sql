-- ============================================================================
-- 04_DYNAMIC_TABLES.SQL — Curated layer for Digital Wallet & Payments Hub Analytics
-- ============================================================================
USE DATABASE DIGITAL_WALLET;
USE SCHEMA CURATED;

-- TRANSACTION_VELOCITY: Real-time transaction velocity metrics per account
-- Source: WALLET_ACCOUNTS, TRANSACTIONS
CREATE OR REPLACE DYNAMIC TABLE CURATED.TRANSACTION_VELOCITY
  TARGET_LAG = '5 minutes'
  WAREHOUSE = WALLET_WH
AS
SELECT * FROM RAW.WALLET_ACCOUNTS;
-- TODO: Replace with actual join/aggregation logic per demo

-- MERCHANT_RISK_PROFILE: Merchant risk scoring based on transaction patterns
-- Source: MERCHANTS, TRANSACTIONS, FRAUD_CASES
CREATE OR REPLACE DYNAMIC TABLE CURATED.MERCHANT_RISK_PROFILE
  TARGET_LAG = '5 minutes'
  WAREHOUSE = WALLET_WH
AS
SELECT * FROM RAW.MERCHANTS;
-- TODO: Replace with actual join/aggregation logic per demo

-- ECOSYSTEM_HEALTH: Overall ecosystem KPIs (DAU, TPV, success rates)
-- Source: WALLET_ACCOUNTS, TRANSACTIONS
CREATE OR REPLACE DYNAMIC TABLE CURATED.ECOSYSTEM_HEALTH
  TARGET_LAG = '5 minutes'
  WAREHOUSE = WALLET_WH
AS
SELECT * FROM RAW.WALLET_ACCOUNTS;
-- TODO: Replace with actual join/aggregation logic per demo

-- FRAUD_TIMESERIES: Hourly fraud metrics for anomaly detection
-- Source: TRANSACTIONS, FRAUD_CASES
CREATE OR REPLACE DYNAMIC TABLE CURATED.FRAUD_TIMESERIES
  TARGET_LAG = '5 minutes'
  WAREHOUSE = WALLET_WH
AS
SELECT * FROM RAW.TRANSACTIONS;
-- TODO: Replace with actual join/aggregation logic per demo

