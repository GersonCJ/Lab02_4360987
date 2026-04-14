-- Coal to Gas transition

SELECT

    dim_iso.iso_code,
    dim_year.year,
    dim_iso.country,
    f.coal_co2_mt,
    f.gas_co2_mt

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

    dim_iso.country = 'Chile'

AND 

    dim_year.year >= 1990


