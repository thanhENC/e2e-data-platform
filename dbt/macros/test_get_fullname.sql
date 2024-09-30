{% macro test_get_fullname() %}
    {% set result = get_fullname('John', 'Doe', 'Smith', 0) %}
    {{ log(result, info=True) }}
{% endmacro %}