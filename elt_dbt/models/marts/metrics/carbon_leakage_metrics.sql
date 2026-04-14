-- Carbon Leakage

SELECT

    dim_iso.country,
    dim_year.year,
    f.co2_mt,
    f.consumption_co2_mt,
    -- Leakage Calculation
    (f.consumption_co2_mt - f.co2_mt) AS carbon_gap

FROM

    {{ref('fact_co2_national')}} as f

JOIN

    {{ref('dim_iso_country_year')}} as dim_year
ON

    f.iso_code = dim_year.iso_code
    AND
    f.year = dim_year.year

JOIN 

    {{ref('dim_iso_country')}} as dim_iso
ON

    dim_iso.iso_code = dim_year.iso_code

WHERE

    dim_iso.iso_code IN ('USA', 'DEU', 'JPN', 'GBR', 'FRA') AND dim_year.year >= 1990