{% macro get_fullname(first_name, middle_name, last_name, name_style) %}
    case
        when {{ name_style }} = false then
            case
                when {{ middle_name }} is not null and {{ middle_name }} != '' then
                    {{ first_name }} || ' ' || {{ middle_name }} || ' ' || {{ last_name }}
                else
                    {{ first_name }} || ' ' || {{ last_name }}
            end
        else
            case
                when {{ middle_name }} is not null and {{ middle_name }} != '' then
                    {{ last_name }} || ' ' || {{ middle_name }} || ' ' || {{ first_name }}
                else
                    {{ last_name }} || ' ' || {{ first_name }}
            end
    end
{% endmacro %}