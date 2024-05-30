-- Unidades de Fornecimento associáveis a categorias de materiais utilizadas em compras públicas da saúde.

MODEL (name bps.unidades, kind FULL);

SELECT
    md5 (
        concat (
            codigoPdm,
            ';',
            siglaUnidadeFornecimento,
            ';',
            siglaUnidadeMedida,
            ';',
            capacidadeUnidadeFornecimento
        )
    ) AS codigo_unidade_fornecimento, -- Identificador da unidade de fornecimento
    codigoPdm AS codigo_pdm, -- Código PDM do material a que se refere a unidade de fornecimento
    lower(siglaUnidadeFornecimento) AS sigla_tipo_unidade_fornecimento, -- Sigla da tipo de unidade de fornecimento
    upper(nomeUnidadeFornecimento) AS tipo_unidade_fornecimento, -- Nome do tipo da unidade de fornecimento
    lower(siglaUnidadeMedida) AS unidade_medida, -- Sigla da unidade de medida
    capacidadeUnidadeFornecimento AS capacidade_unidade_fornecimento, -- Capacidade da unidade de fornecimento em unidades de medida
    upper(descricaoUnidadeFornecimento) AS descricao_unidade_fornecimento, -- Descrição da unidade de fornecimento
FROM
    (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY
                    codigoPdm,
                    siglaUnidadeFornecimento,
                    siglaUnidadeMedida,
                    capacidadeUnidadeFornecimento,
                    statusUnidadeFornecimentoPdm
                ORDER BY
                    dataHoraAtualizacao DESC
            ) AS rn
        FROM
            siasg.unidades
    )
WHERE
    rn = 1
    AND statusUnidadeFornecimentoPdm IS TRUE
ORDER BY
    codigoPdm,
    siglaUnidadeFornecimento,
    siglaUnidadeMedida,
    capacidadeUnidadeFornecimento;