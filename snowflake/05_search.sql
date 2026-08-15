-- ============================================================================
-- 05_SEARCH.SQL — Cortex Search for Digital Wallet & Payments Hub Analytics
-- ============================================================================
USE DATABASE DIGITAL_WALLET;
USE SCHEMA SEARCH;

CREATE OR REPLACE CORTEX SEARCH SERVICE SEARCH.FRAUD_CASE_SEARCH
  ON CASE_NARRATIVE
  ATTRIBUTES FRAUD_TYPE, CHANNEL, SEVERITY
  WAREHOUSE = WALLET_WH
  TARGET_LAG = '1 hour'
AS (
  SELECT * FROM RAW.FRAUD_CASES
);
