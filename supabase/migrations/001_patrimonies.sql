-- ============================================================================
-- FinanceHub
-- Migration : 001_patrimonies.sql
-- Objetivo  : Criação da entidade Patrimônio
-- Plataforma: PostgreSQL / Supabase
-- ============================================================================

CREATE TABLE public.patrimonies (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES auth.users(id)
        ON DELETE CASCADE,

    title VARCHAR(120) NOT NULL,

    description TEXT,

    type VARCHAR(20) NOT NULL
        CHECK (
            type IN (
                'PERSONAL',
                'FAMILY',
                'BUSINESS',
                'SHARED'
            )
        ),

    currency_code CHAR(3) NOT NULL DEFAULT 'BRL',

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    deleted_at TIMESTAMPTZ

);

COMMENT ON TABLE public.patrimonies IS
'Representa uma realidade financeira independente pertencente a um usuário.';

COMMENT ON COLUMN public.patrimonies.title IS
'Nome do patrimônio. Ex.: Pessoal, Família, Empresa.';

COMMENT ON COLUMN public.patrimonies.type IS
'Tipo do patrimônio.';

COMMENT ON COLUMN public.patrimonies.currency_code IS
'Moeda principal utilizada pelo patrimônio.';

CREATE INDEX idx_patrimonies_user
ON public.patrimonies(user_id);

CREATE TRIGGER trg_touch_patrimonies_updated_at
BEFORE UPDATE
ON public.patrimonies
FOR EACH ROW
EXECUTE FUNCTION public.touch_updated_at();
