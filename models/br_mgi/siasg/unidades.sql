MODEL (
  name siasg.unidades,
  kind FULL,
  grain (
    codigoPdm,
    numeroSequencialUnidadeFornecimento,
    statusUnidadeFornecimentoPdm,
    dataHoraAtualizacao
  )
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