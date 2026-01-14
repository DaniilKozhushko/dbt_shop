{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {# В DEV и TEST игнорируем кастомные схемы и всё пишем в analytics_dev или analytics_test #}
    {%- if target.name == 'dev' or target.name == 'test' -%}

        {{ default_schema }}

    {# В PROD, если указана кастомная схема (например, staging), используем её #}
    {%- elif custom_schema_name is not none -%}

        {{ custom_schema_name | trim }}

    {# Если в PROD схема не указана, используем дефолтную (analytics) #}
    {%- else -%}

        {{ default_schema }}

    {%- endif -%}

{%- endmacro %}