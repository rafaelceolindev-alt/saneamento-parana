-- =============================================
-- 01_carga.sql
-- O que faz: Filtra os dados do SNIS para o Paraná e salva em Parquet.
-- Fonte: Base dos Dados, SNIS (Ministério das Cidades), tabela de prestadores de água e esgoto. (br_mdr_snis_prestador_agua_esgoto.csv)
-- Saída: snis_pr.parquet
-- =============================================

-- Passo 1: Filtra
CREATE OR REPLACE TABLE snis_pr AS
SELECT *
FROM read_csv_auto('data/raw/br_mdr_snis_prestador_agua_esgoto.csv')
WHERE sigla_uf = 'PR';

-- Passo 2: Parquet
COPY snis_pr TO 'data/processed/snis_pr.parquet' (FORMAT parquet);