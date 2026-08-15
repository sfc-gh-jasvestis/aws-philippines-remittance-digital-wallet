-- ============================================================================
-- Digital Wallet & Payments Hub Analytics
-- GCash and Maya have 90M+ accounts — Snowflake detects payment fraud in real-time with anomaly detection, monitors wallet ecosystem health, and alerts on suspicious patterns before losses materialize.
-- ============================================================================
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS DIGITAL_WALLET;
CREATE WAREHOUSE IF NOT EXISTS WALLET_WH WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE;
USE DATABASE DIGITAL_WALLET;
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS CURATED;
CREATE SCHEMA IF NOT EXISTS ML;
CREATE SCHEMA IF NOT EXISTS AI;
CREATE SCHEMA IF NOT EXISTS SEARCH;
CREATE SCHEMA IF NOT EXISTS APP;

USE WAREHOUSE WALLET_WH;
