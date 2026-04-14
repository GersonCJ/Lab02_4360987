-- Amazon Effect

SELECT
    dim_iso.country,
    dim_year.year,
    f.land_use_change_co2_mt,
    f.total_ghg_mt,
    {{ gas_emission_over_ghg('f.land_use_change_co2_mt', 'f.total_ghg_mt') }} AS land_use_over_ghg_prct

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

    dim_iso.country = 'Brazil' AND dim_year.year >= 1990