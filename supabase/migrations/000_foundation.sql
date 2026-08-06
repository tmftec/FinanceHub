-- ============================================================================
-- FinanceHub
-- Migration : 000_foundation.sql
-- Objetivo  : Infraestrutura compartilhada do banco
-- Plataforma: PostgreSQL / Supabase
-- ============================================================================

------------------------------------------------------------
-- Extensions
------------------------------------------------------------

CREATE EXTENSION IF NOT EXISTS pgcrypto;

------------------------------------------------------------
-- Shared Functions
------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.touch_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;

COMMENT ON FUNCTION public.touch_updated_at() IS
'Atualiza automaticamente o campo updated_at.';
