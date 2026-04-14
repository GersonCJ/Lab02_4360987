with source AS (
    SELECT * FROM {{ ref('int_co2_national') }}
)

SELECT
    iso_code,
    year,
    country,
    population_people,
    gdp_usd
FROM source