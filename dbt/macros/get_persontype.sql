{# get_persontype macro: retrieving person type as plain text #}

{% macro get_persontype(person_type) %}
    case
        when {{ person_type }} = 'SC' then 'Store Contact'
        when {{ person_type }} = 'IN' then 'Individual'
        when {{ person_type }} = 'SP' then 'Sales Person'
        when {{ person_type }} = 'EM' then 'Employee'
        when {{ person_type }} = 'VC' then 'Vendor Contact'
        when {{ person_type }} = 'GC' then 'General Contact'
        else 'Unknown'
    end
{% endmacro %}