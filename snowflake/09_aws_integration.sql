-- ============================================================================
-- 09_AWS_INTEGRATION.SQL — AWS services for Digital Wallet & Payments Hub Analytics
-- Account: 018437500440 | Region: ap-southeast-1
-- Skip this script for Snowflake-only build
-- ============================================================================
USE DATABASE DIGITAL_WALLET;
USE SCHEMA APP;

-- ==================== AMAZON SNS ====================
CREATE OR REPLACE NETWORK RULE APP.SNS_NETWORK_RULE
  MODE = EGRESS
  TYPE = HOST_PORT
  VALUE_LIST = ('sns.ap-southeast-1.amazonaws.com:443');

CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION aws_philippines_remittance_digital_wallet_SNS_EAI
  ALLOWED_NETWORK_RULES = (DIGITAL_WALLET.APP.SNS_NETWORK_RULE)
  ALLOWED_AUTHENTICATION_SECRETS = (DIGITAL_WALLET.APP.AWS_BEDROCK_SECRET)
  ENABLED = TRUE
  COMMENT = 'SNS access for Digital Wallet & Payments Hub Analytics alerts';

-- SNS Topic ARN: arn:aws:sns:ap-southeast-1:018437500440:sea-demos-aws-philippines-remittance-digital-wallet

-- ==================== KINESIS / IOT CORE INGESTION ====================
-- Snowpipe from Kinesis Data Stream
-- Stream ARN: arn:aws:kinesis:ap-southeast-1:018437500440:stream/aws-philippines-remittance-digital-wallet-stream

CREATE OR REPLACE PIPE RAW.REALTIME_PIPE
  AUTO_INGEST = TRUE
  INTEGRATION = 'aws_philippines_remittance_digital_wallet_S3_INT'
  COMMENT = 'Auto-ingest from Kinesis via S3 delivery stream'
AS
COPY INTO RAW.WALLET_ACCOUNTS
FROM @RAW.LANDING_STAGE/realtime/
FILE_FORMAT = (TYPE = 'JSON');

