with source_data AS (
    SELECT * FROM {{source('staging_raw_sources', 'raw_full')}}
),

renamed AS (
    SELECT
        iso_code,
        year,
        country,
        population AS population_people,
        gdp AS gdp_usd,
        co2 AS co2_mt,
        co2_including_luc AS co2_including_luc_mt,
        consumption_co2 AS consumption_co2_mt,
        primary_energy_consumption AS primary_energy_consumption_twh,
        cement_co2 AS cement_co2_mt,
        coal_co2 AS coal_co2_mt,
        flaring_co2 AS flaring_co2_mt,
        gas_co2 AS gas_co2_mt,
        land_use_change_co2 AS land_use_change_co2_mt,
        oil_co2 AS oil_co2_mt,
        other_industry_co2 AS other_industry_co2_mt,
        trade_co2 AS trade_co2_mt,
        methane AS methane_mt,
        nitrous_oxide AS nitrous_oxide_mt,
        total_ghg AS total_ghg_mt,
        total_ghg_excluding_lucf AS total_ghg_excluding_lucf_mt,
        temperature_change_from_ch4 AS temperature_change_from_ch4_degrees_c,
        temperature_change_from_co2 AS temperature_change_from_co2_degrees_c,
        temperature_change_from_ghg AS temperature_change_from_ghg_degrees_c,
        temperature_change_from_n2o AS temperature_change_from_n2o_degrees_c

    FROM source_data
)

SELECT * FROM renamed