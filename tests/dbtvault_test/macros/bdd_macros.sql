{%- macro drop_model(model_name) -%}

    {%- set source_relation = adapter.get_relation(
          database=target.database,
          schema=target.schema,
          identifier=model_name) -%}

    {% if source_relation %}
        {%- do adapter.drop_relation(source_relation) -%}
        {% do log('Successfully dropped model ' ~ "'" ~ model_name ~ "'", true) %}
    {% else %}
        {% do log('Nothing to drop', true) %}
    {% endif %}

{%- endmacro -%}

{% macro check_model_exists(model_name) %}

    {%- set source_relation = adapter.get_relation(
          database=target.database,
          schema=target.schema,
          identifier=model_name) -%}

    {% if source_relation %}
        {% do log('Model {} exists.'.format(model_name), true) %}
    {% else %}
        {% do log('Model {} does not exist.'.format(model_name), true) %}
    {% endif %}

{% endmacro %}

{%- macro drop_test_schemas() -%}

{% do adapter.drop_schema(api.Relation.create(database=target.database, schema="TEST")) %}
{% do adapter.drop_schema(api.Relation.create(database=target.database, schema="TEST_RAW")) %}
{% do adapter.drop_schema(api.Relation.create(database=target.database, schema="TEST_STG")) %}
{% do adapter.drop_schema(api.Relation.create(database=target.database, schema="TEST_VLT")) %}

{% endmacro %}

{%- macro create_test_schemas() -%}

{% do adapter.create_schema(api.Relation.create(database=target.database, schema="TEST")) %}
{% do adapter.create_schema(api.Relation.create(database=target.database, schema="TEST_RAW")) %}
{% do adapter.create_schema(api.Relation.create(database=target.database, schema="TEST_STG")) %}
{% do adapter.create_schema(api.Relation.create(database=target.database, schema="TEST_VLT")) %}

{%- endmacro -%}

{%- macro recreate_current_schemas() -%}

{% do drop_test_schemas() %}
{% do create_test_schemas() %}

{%- endmacro -%}