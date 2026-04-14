with source AS (
    SELECT * FROM {{ ref('stg_co2_data') }}
),

national_table AS (
    SELECT * FROM source 
    WHERE iso_code IS NOT NULL
        AND length(iso_code) = 3        -- Only country coded
        AND iso_code NOT LIKE 'OWID%'   -- Aggregated by OWID are cutout 
)

SELECT * FROM national_table