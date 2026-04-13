with staging AS (
    SELECT * FROM {{ ref('stg_co2_data') }}
),

national_table AS (
    SELECT * FROM staging 
    WHERE iso_code IS NOT NULL
        AND length(iso_code) = 3        -- Only country coded
        AND iso_code NOT LIKE 'OWID%'   -- Aggregated by OWID are cutout 
)

SELECT * FROM national_table