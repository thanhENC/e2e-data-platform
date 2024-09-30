{# 
    classify product color into categories: light, medium, dark
 #}

{% macro classify_color(color) %}
    {% set dark_colors = ("Grey", "Black") %}
    {% set light_colors = ("Yellow", "White", "Silver") %}
    {% set medium_colors = ("Red", "Green", "Blue", "Multi", "Silver/Black") %}
    
    case
        when pr.color in {{ dark_colors }} then 'Dark'
        when pr.color in {{ light_colors }} then 'Light'
        when pr.color in {{ medium_colors }} then 'Medium'
        else 'Unknown'
    end
{% endmacro %}