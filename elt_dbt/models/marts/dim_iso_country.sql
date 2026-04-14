with source AS (
    SELECT * FROM {{ ref('int_co2_national') }}
)

SELECT DISTINCT
    iso_code,
    country
FROM source