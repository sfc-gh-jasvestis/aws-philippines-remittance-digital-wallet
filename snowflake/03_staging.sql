-- ============================================================================
-- 03_STAGING.SQL — Generate synthetic data for Digital Wallet & Payments Hub Analytics
-- Country: PHILIPPINES | Currency: PHP
-- ============================================================================
USE DATABASE DIGITAL_WALLET;
USE SCHEMA RAW;

-- Data generation scripts are demo-specific.
-- See the handcrafted SQL in the aws-malaysia-semiconductor-yield demo for
-- the full pattern: GENERATOR + UNIFORM + LATERAL for distribution,
-- Cortex Complete for text generation, engineered key demo numbers.

-- Target row counts:
-- WALLET_ACCOUNTS: 4,500,000 rows — Wallet user accounts (anonymized demographics, KYC tier)
-- TRANSACTIONS: 18,000,000 rows — 30 days of payment transactions (P2P, bills, QR, top-up)
-- MERCHANTS: 125,000 rows — Merchant profiles (sari-sari stores to malls)
-- FRAUD_CASES: 8,500 rows — Confirmed fraud cases for model training
-- DEVICE_SIGNALS: 5,000,000 rows — Device fingerprints and login behavior
-- NETWORK_GRAPH: 2,200,000 rows — Account-to-account transfer relationships
