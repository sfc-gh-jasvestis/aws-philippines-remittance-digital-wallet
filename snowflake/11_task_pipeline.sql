-- ============================================================================
-- 11_TASK_PIPELINE.SQL — Task DAG for Digital Wallet & Payments Hub Analytics
-- ============================================================================
USE DATABASE DIGITAL_WALLET;
USE SCHEMA APP;

CREATE OR REPLACE TASK APP.TASK_STREAM_TRANSACTIONS
  WAREHOUSE = WALLET_WH
  SCHEDULE = 'USING CRON */1 * * * * UTC'
  COMMENT = 'Ingest latest transactions from Kinesis'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_SCORE_FRAUD
  WAREHOUSE = WALLET_WH
  AFTER APP.TASK_STREAM_TRANSACTIONS
  COMMENT = 'Score new transactions for fraud risk'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_ALERT_RISK
  WAREHOUSE = WALLET_WH
  AFTER APP.TASK_SCORE_FRAUD
  COMMENT = 'Send SNS alerts for high-risk transactions'
AS
  SELECT 1; -- Replace with actual refresh logic

ALTER TASK APP.TASK_ALERT_RISK RESUME;
ALTER TASK APP.TASK_SCORE_FRAUD RESUME;
ALTER TASK APP.TASK_STREAM_TRANSACTIONS RESUME;
