-- ============================================================================
-- 10_ALERTS_NOTIFICATIONS.SQL — Alerts for Digital Wallet & Payments Hub Analytics
-- ============================================================================
USE DATABASE DIGITAL_WALLET;
USE SCHEMA APP;

-- Notification integration (email)
CREATE OR REPLACE NOTIFICATION INTEGRATION aws_philippines_remittance_digital_wallet_EMAIL_INT
  TYPE = EMAIL
  ENABLED = TRUE
  ALLOWED_RECIPIENTS = ('jonathan.asvestis@snowflake.com');

-- Alert: FRAUD_SPIKE_ALERT
CREATE OR REPLACE ALERT APP.FRAUD_SPIKE_ALERT
  WAREHOUSE = WALLET_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Fraud rate spike detected in payment channel'
IF (EXISTS (
  SELECT 1 FROM CURATED.TRANSACTION_VELOCITY
  WHERE 1=1 -- Condition: HOURLY_FRAUD_RATE > 2x BASELINE for any channel
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_philippines_remittance_digital_wallet_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Digital Wallet & Payments Hub Analytics: Fraud rate spike detected in payment channel',
    'Fraud rate spike detected in payment channel'
  );

ALTER ALERT APP.FRAUD_SPIKE_ALERT RESUME;

-- Alert: VELOCITY_ALERT
CREATE OR REPLACE ALERT APP.VELOCITY_ALERT
  WAREHOUSE = WALLET_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Suspicious transaction velocity on account'
IF (EXISTS (
  SELECT 1 FROM CURATED.TRANSACTION_VELOCITY
  WHERE 1=1 -- Condition: TXN_COUNT_1H > 50 for any single account
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_philippines_remittance_digital_wallet_EMAIL_INT',
    'jonathan.asvestis@snowflake.com',
    '[ALERT] Digital Wallet & Payments Hub Analytics: Suspicious transaction velocity on account',
    'Suspicious transaction velocity on account'
  );

ALTER ALERT APP.VELOCITY_ALERT RESUME;

