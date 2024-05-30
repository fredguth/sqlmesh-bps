-- Categorias de materiais utilizadas em compras públicas da saúde. 
MODEL (
  name bps.materiais,
  kind FULL
);

SELECT
  codigoItem as codigo_item_catalogo, -- Código do item (categoria de material)
  descricaoItem as descricao_item, -- Descrição do item (categoria de material)
  statusItem as status_ativo, -- Status do item (ativo = true  ou nao = false)
  codigoPdm as codigo_pdm, -- Código do PDM do item
  nomePdm as pdm, -- Nome do PDM do item
  codigoGrupo as codigo_grupo, -- Código do grupo do item
  nomeGrupo as grupo, -- Nome do grupo do item
  codigoClasse as codigo_classe, -- Código da classe do item
  nomeClasse as classe, -- Nome da classe do item
  itemSustentavel as item_sustentavel, -- Item é sustentável (sim = true ou não = false)
  dataHoraAtualizacao as atualizado_em -- Data e hora da atualização
FROM siasg.materiais;