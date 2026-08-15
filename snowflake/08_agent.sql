-- ============================================================================
-- 08_AGENT.SQL — Cortex Agent for Digital Wallet & Payments Hub Analytics
-- ============================================================================
USE DATABASE DIGITAL_WALLET;
USE SCHEMA APP;

CREATE OR REPLACE CORTEX AGENT APP.WALLET_INTELLIGENCE_AGENT
  COMMENT = 'Digital Wallet & Payments Hub Analytics AI Assistant'
  MODEL = 'claude-opus-4-8'
  TOOLS = (
    SEMANTIC_VIEW_TOOL(SEMANTIC_VIEW => 'DIGITAL_WALLET.APP.WALLET_ANALYTICS'),    CORTEX_SEARCH_TOOL(CORTEX_SEARCH_SERVICE => 'DIGITAL_WALLET.SEARCH.FRAUD_CASE_SEARCH', TOOL_DESCRIPTION => 'Search documents for Remittances & Fintech information')
  )
  SYSTEM_PROMPT = 'You are the Digital Wallet Intelligence Agent for a Philippine fintech with 4.5M wallet accounts processing 18M monthly transactions across P2P, bills payment, QR, and top-up channels.';
