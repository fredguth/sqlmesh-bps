-- Divisão Territorial Brasileira apresenta a relação de subdistritos, distritos e municípios que compõem a divisão territorial brasileira oficial segundo o IBGE
MODEL (
  name dtb.territorio,
  kind FULL
);

SELECT
  codigo_regiao, -- código ibge para as regioes brasileiras: 1=Norte;2=Nordeste;3=Sudeste;4=Sul;5=Centro-Oeste
  nome_regiao, -- nome da região: Norte, Nordeste, Sudeste, Sul, Centro-Oeste 
  codigo_uf, -- código do ibge com dois digitos que representam unicamente cada unidade da federação 
  sigla_uf, -- sigla da unidade da federação 
  nome_uf, -- nome da unidade da federação 
  codigo_regiao_geografica_intermediaria, -- código ibge que identifica unicamente cada região geográfica intermediária 
  regiao_geografica_intermediaria, -- região geográfica intermediária 
  codigo_regiao_geografica_imediata, -- código ibge que identifica unicamente cada região geográfica imediata 
  regiao_geografica_imediata, -- região geográfica imediata 
  codigo_mesorregiao, --  código ibge que identifica unicamente cada mesorregião 
  nome_mesoregiao, -- nome da mesorregião 
  codigo_microrregiao, -- código ibge que identifica unicamente cada microrregião 
  nome_microrregiao, -- nome da microrregião 
  codigo_municipio_5, -- código ibge que identifica unicamente cada município com 5 dígitos 
  codigo_municipio_6, -- código ibge que identifica unicamente cada município com 6 dígitos 
  codigo_municipio_7, -- código ibge que identifica unicamente cada município com 7 dígitos 
  nome_municipio -- nome oficial do município 
FROM READ_PARQUET('seeds/ibge.parquet')