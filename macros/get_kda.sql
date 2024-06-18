{% macro get_kda(kills, deaths, assists) %}
    case 
        when {{ deaths }} = 0 then {{ kills }} + {{ assists }}
        else ({{ kills }} + {{ assists }}) / ({{ deaths }})
    end
{% endmacro %}
