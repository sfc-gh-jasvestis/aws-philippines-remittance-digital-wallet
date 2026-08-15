-- ============================================================================
-- 07_SEMANTIC_VIEW.SQL — Semantic View for Digital Wallet & Payments Hub Analytics
-- ============================================================================
USE DATABASE DIGITAL_WALLET;
USE SCHEMA APP;

CREATE OR REPLACE SEMANTIC VIEW APP.WALLET_ANALYTICS
  COMMENT = 'Digital wallet transactions, fraud detection, and ecosystem health analytics'
AS
  TABLES (
    CURATED.TRANSACTION_VELOCITY AS transaction_velocity,CURATED.MERCHANT_RISK_PROFILE AS merchant_risk_profile,CURATED.ECOSYSTEM_HEALTH AS ecosystem_health,CURATED.FRAUD_TIMESERIES AS fraud_timeseries
  );
