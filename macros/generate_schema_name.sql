{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}
    
    {%- elif env_var('DBT_PSG_ENV') in ['prod','uat'] %}

        {{ custom_schema_name | trim}}

    {%- else -%}

        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}


{%- endmacro %}