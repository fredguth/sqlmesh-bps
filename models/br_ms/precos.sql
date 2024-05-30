-- precos praticados em compras públicas na saúde
MODEL (name bps.precos, kind FULL);


select 
data_compra::date as data_compra, -- data da compra (homologação do processo de compra)
codigo_compra, -- Identificador da compra (siasg)
codigo_item_compra, -- Identificador do item da compra (siasg)
codigo_item_catalogo, -- Código do item no catálogo (siasg); código da categoria do material
  md5 (
        concat (
            codigo_pdm,
            ';',
            sigla_tipo_unidade_fornecimento,
            ';',
            unidade_medida,
            ';',
            capacidade_unidade_fornecimento
        )
    ) AS codigo_unidade_fornecimento, -- Identificador da unidade de fornecimento (bps)

codigo_uasg, -- identificador da unidade de gestão no governo (siasg)
cnpj_fornecedor, -- CNPJ do fornecedor (estrangeiros não possuem CNPJ)
fornecedor, -- nome do fornecedor 
marca_fabricante ,-- marca do item comprado
quantidade, -- quantidade compra (em unidades de fornecimento)
preco_unitario::decimal(18,2) as preco_unitario, -- preço de uma unidade de fornecimento do material comprado

from (
SELECT distinct
  c.*,
  m.codigo_pdm,
  m.descricao_item
FROM
  (
    SELECT
      idCompra AS codigo_compra,
      idItemCompra AS codigo_item_compra,
      codigoItemCatalogo AS codigo_item_catalogo,
      siglaUnidadeFornecimento AS sigla_tipo_unidade_fornecimento,
      nomeUnidadeFornecimento AS tipo_unidade_fornecimento,
      siglaUnidadeMedida AS unidade_medida,
      capacidadeUnidadeFornecimento AS capacidade_unidade_fornecimento,
      quantidade AS quantidade,
      precoUnitario AS preco_unitario,
      niFornecedor AS cnpj_fornecedor,
      nomeFornecedor AS fornecedor,
      marca AS marca_fabricante,
      codigoUasg AS codigo_uasg,
      dataCompra AS data_compra
    FROM
      siasg.compras
  ) AS c
  left JOIN bps.materiais AS m ON c.codigo_item_catalogo = m.codigo_item_catalogo)
  order by data_compra, codigo_compra, codigo_item_compra;