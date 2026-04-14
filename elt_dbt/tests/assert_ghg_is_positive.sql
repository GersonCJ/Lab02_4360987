-- Buscamos anos ondea emissão foi menor que zero, o que seria um erro de dado.

SELECT

    iso_code,
    year,
    total_ghg_mt

FROM {{ ref('fact_co2_national') }}

WHERE

    total_ghg_mt < 0