-- Dados sobre categorias de materiais da saúde extraídas do sistema SIASG (módulo CATMAT) do MGI através da API pública de compras do governo federal https://dadosabertos.compras.gov.br/swagger-ui/index.html#
MODEL (
  name siasg.materiais,
  kind FULL,
  grain (codigoItem, dataHoraAtualizacao)
);

SELECT
  codigoGrupo, -- Código do grupo
  nomeGrupo, -- Nome do grupo
  codigoClasse, -- Código da classe
  nomeClasse, -- Nome da classe
  codigoPdm, -- Código do PDM
  nomePdm, -- Nome do PDM
  codigoItem, -- Código do item
  descricaoItem, -- Descrição do item
  statusItem, -- Status do item
  itemSustentavel, -- Item sustentável
  dataHoraAtualizacao -- Data e hora da atualização
FROM READ_JSON_AUTO('seeds/materiais/**/record*.json', format = 'array', hive_partitioning = TRUE)