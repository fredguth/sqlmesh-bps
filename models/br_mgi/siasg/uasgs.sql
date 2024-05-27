MODEL (
    name siasg.uasgs,
    kind FULL,
  grain codigoUasg
);

SELECT DISTINCT
  codigoUasg, -- Código da UASG
  nomeUasg, -- Nome da UASG
  usoSisg, -- Uso do SISG (sistema)
  adesaoSiasg, -- Adesão ao SIASG
  siglaUf, -- Sigla da UF
  codigoMunicipio,  -- Código do município 
  codigoMunicipioIbge,  -- Código do município no IBGE
  nomeMunicipioIbge, -- Nome do município no IBGE
  codigoUnidadePolo,
  nomeUnidadePolo,
  codigoUnidadeEspelho,
  nomeUnidadeEspelho,
  uasgCadastradora,
  cnpjCpfUasg,
  codigoOrgao,
  cnpjCpfOrgao,
  cnpjCpfOrgaoVinculado,
  cnpjCpfOrgaoSuperior,
  codigoSiorg,
  statusUasg,
  dataImplantacaoSidec,
  dataHoraMovimento,
FROM READ_JSON_AUTO('seeds/uasgs/*.json')

