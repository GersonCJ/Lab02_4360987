-- ghg / gdp
{% macro ghg_intensity(total_ghg, gdp_converted) %}
    ({{ total_ghg }} / NULLIF({{ gdp_to_billions(gdp_converted) }}, 0))
{% endmacro %}    