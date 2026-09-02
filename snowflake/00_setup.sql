-- Generated from generator/demo_specs/aws-philippines-remittance-digital-wallet.json
-- Regenerate with: python3 generator/gen_repo_docs.py aws-philippines-remittance-digital-wallet
-- This is the schema that is actually deployed for PH_REMITTANCE_DIGITAL_WALLET.

-- PH_REMITTANCE_DIGITAL_WALLET  (Digital Wallet & Payments Hub Analytics)
-- generated from generator/demo_specs/aws-philippines-remittance-digital-wallet.json - do not hand-edit
CREATE DATABASE IF NOT EXISTS PH_REMITTANCE_DIGITAL_WALLET;
CREATE SCHEMA IF NOT EXISTS PH_REMITTANCE_DIGITAL_WALLET.RAW;
CREATE SCHEMA IF NOT EXISTS PH_REMITTANCE_DIGITAL_WALLET.CURATED;
CREATE SCHEMA IF NOT EXISTS PH_REMITTANCE_DIGITAL_WALLET.APP;
USE DATABASE PH_REMITTANCE_DIGITAL_WALLET;

-- 5 real regions; entity names carry their region so the two always agree
