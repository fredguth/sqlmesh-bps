-- Dados sobre unidades de fornecimento de materiais da saúde extraídas do sistema SIASG (módulo CATMAT) do MGI através da API pública de compras do governo federal https://dadosabertos.compras.gov.br/swagger-ui/index.html#
MODEL (
  name siasg.unidades,
  kind FULL
);

SELECT DISTINCT
  codigoPdm,  -- Código PDM
  siglaUnidadeFornecimento,  -- Sigla da unidade de fornecimento
  nomeUnidadeFornecimento,  -- Nome da unidade de fornecimento
  descricaoUnidadeFornecimento,  -- Descrição da unidade de fornecimento
  siglaUnidadeMedida,  -- Sigla da unidade de medida
  capacidadeUnidadeFornecimento,  -- Capacidade da unidade de fornecimento
  numeroSequencialUnidadeFornecimento,  -- Número sequencial da unidade de fornecimento
  statusUnidadeFornecimentoPdm,  -- Status da unidade de fornecimento PDM
  dataHoraAtualizacao  -- Data e hora da atualização
FROM
  READ_JSON_AUTO ('seeds/materiais/unidades/**/page*.json')