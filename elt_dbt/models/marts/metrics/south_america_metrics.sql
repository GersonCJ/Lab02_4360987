-- South America rank of emissions

SELECT
    
    dim_iso.country,
    SUM({{ metric_per_capta('f.co2_mt', 'dim_year.population_people') }} + {{ metric_per_capta('f.total_ghg_mt', 'dim_year.population_people') }}) AS cumulative_intensity

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

WHERE dim_iso.country IN ('Argentina', 'Bolivia', 'Brazil', 'Chile', 'Colombia', 'Ecuador', 'Guyana', 'Paraguay', 'Peru', 'Suriname', 'Uruguay', 'Venezuela')

AND dim_year.year >= 2001

GROUP BY dim_iso.country

ORDER BY cumulative_intensity ASC