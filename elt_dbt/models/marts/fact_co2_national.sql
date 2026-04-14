with source AS (
    SELECT * FROM {{ ref('int_co2_national') }}
)

SELECT
    iso_code,
    year,
    co2_mt,
    co2_including_luc_mt,
    consumption_co2_mt,
    primary_energy_consumption_twh,
    cement_co2_mt,
    coal_co2_mt,
    flaring_co2_mt,
    gas_co2_mt,
    land_use_change_co2_mt,
    oil_co2_mt,
    other_industry_co2_mt,
    trade_co2_mt,
    methane_mt,
    nitrous_oxide_mt,
    total_ghg_mt,
    total_ghg_excluding_lucf_mt,
    temperature_change_from_ch4_degrees_c,
    temperature_change_from_co2_degrees_c,
    temperature_change_from_ghg_degrees_c,
    temperature_change_from_n2o_degrees_c
FROM source