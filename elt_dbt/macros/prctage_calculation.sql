-- Calculates percentage of an specific emission over the total ghg

{% macro gas_emission_over_ghg(specific_gas_emission, total_ghg) %}
    ({{ specific_gas_emission }} / {{ total_ghg }}) * 100
{% endmacro %}    