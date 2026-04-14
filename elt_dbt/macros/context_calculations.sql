-- Calculates gdp in billions of dollars

{% macro gdp_to_billions(gdp_value) %}
    ({{ gdp_value }} / {{ 1e9 }})::numeric(16, 2)
{% endmacro %}


-- Calculates metric per capta

{% macro metric_per_capta(metric_analysed, population_people) %}
    ({{ metric_analysed }} / {{ population_people }})
{% endmacro %}


