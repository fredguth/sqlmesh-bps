MODEL (
  name siasg.compras,
  kind FULL,
  grain (idCompra, idItemCompra)
);

SELECT DISTINCT
  idCompra, -- Identificador da compra
  idItemCompra, -- Identificador do item da compra
  -- forma, -- Forma de aquisição do item
  modalidade, -- Modalidade de aquisição do item
  criterioJulgamento, -- Critério de julgamento da compra
  -- numeroItemCompra, -- Número do item da compra
  descricaoItem, -- Descrição do item
  codigoItemCatalogo, -- Código do item no catálogo
  nomeUnidadeMedida, -- Nome da unidade de medida
  siglaUnidadeMedida, -- Sigla da unidade de medida
  nomeUnidadeFornecimento, -- Nome da unidade de fornecimento
  siglaUnidadeFornecimento, -- Sigla da unidade de fornecimento
  capacidadeUnidadeFornecimento, -- Capacidade da unidade de fornecimento
  quantidade, -- Quantidade adquirida
  precoUnitario, -- Preço unitário
  percentualMaiorDesconto, -- Percentual de desconto
  niFornecedor, -- Número de identificação do fornecedor
  nomeFornecedor, -- Nome do fornecedor
  marca, -- Marca do item
  codigoUasg, -- Código da UASG
  nomeUasg, -- Nome da UASG
  codigoMunicipio, -- Código do município
  -- municipio, -- Município
  -- estado, -- Estado
  -- codigoOrgao, -- Código do órgão
  nomeOrgao, -- Nome do órgão
  -- poder, -- Poder
  -- esfera, -- Esfera
  dataCompra, -- Data da compra
  dataHoraAtualizacaoCompra, -- Data e hora da atualização da compra
  dataHoraAtualizacaoItem, -- Data e hora da atualização do item
  dataResultado, -- Data do resultado do processo de compra
  dataHoraAtualizacaoUasg -- Data e hora da atualização da UASG

FROM READ_PARQUET('seeds/compras.parquet')
