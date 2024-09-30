{# 
    This macro returns the
    - product line
    - product class
    - product style
#}

{% macro get_productline(productlinecode) %}
    case
        when {{ productlinecode }} = 'R' then 'Road'
        when {{ productlinecode }} = 'M' then 'Mountain'
        when {{ productlinecode }} = 'T' then 'Touring'
        when {{ productlinecode }} = 'S' then 'Standard'
        else 'Unknown'
    end
{% endmacro %}

{% macro get_productclass(productclasscode) %}
    case
        when {{ productclasscode }} = 'H' then 'High'
        when {{ productclasscode }} = 'M' then 'Medium'
        when {{ productclasscode }} = 'L' then 'Low'
        else 'Unknown'
    end
{% endmacro %}

{% macro get_productstyle(productstylecode) %}
    case
        when {{ productstylecode }} = 'W' then 'Women'
        when {{ productstylecode }} = 'M' then 'Men'
        when {{ productstylecode }} = 'U' then 'Unisex'
        else 'Unknown'
    end
{% endmacro %}