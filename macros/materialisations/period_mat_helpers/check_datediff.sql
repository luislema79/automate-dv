/*
 * Copyright (c) Business Thinking Ltd. 2019-2023
 * This software includes code developed by the AutomateDV (f.k.a dbtvault) Team at Business Thinking Ltd. Trading as Datavault
 */

{%- macro check_num_periods(start_date, stop_date, period) -%}

    {% set num_periods = adapter.dispatch('check_num_periods', 'automate_dv')(
                                          start_date=start_date,
                                          stop_date=stop_date,
                                          period=period) %}

    {%- if num_periods > 100000 -%}
        {%- set error_message -%}
        'Max iterations is 100,000. Consider using a different datepart value (e.g. day)
        or loading data for a shorter time period.
        vault_insert_by materialisations are not intended for this purpose,
        please see https://automate_dv.readthedocs.io/en/latest/materialisations/'
        {%- endset -%}

        {{- exceptions.raise_compiler_error(error_message) -}}
    {%- endif -%}

    {% do return(num_periods) %}

{%- endmacro %}

{% macro default__check_num_periods(start_date, stop_date, period) %}

    {% set num_periods_check_sql %}
    SELECT {{ datediff('start_timestamp', 'stop_timestamp', period) }} AS NUM_PERIODS
    FROM
    (SELECT CAST('{{ start_date }}' AS {{ dbt.type_timestamp() }}) AS start_timestamp,
        CAST(NULLIF('{{ stop_date | lower }}', 'none') AS {{ dbt.type_timestamp() }}) AS stop_timestamp)
    {% endset %}
    {% set num_periods_dict = automate_dv.get_query_results_as_dict(num_periods_check_sql) %}
    {% set num_periods = num_periods_dict['NUM_PERIODS'][0] | int %}

    {% do return(num_periods) %}

{% endmacro %}

{% macro sqlserver__check_num_periods(start_date, stop_date, period) %}

    {% set num_periods_check_sql %}
    SELECT DATEDIFF_BIG({{ period }}, CAST('{{ start_date }}' AS DATETIME2),
        CAST(NULLIF('{{ stop_date | lower }}', 'none') AS DATETIME2)) AS NUM_PERIODS
    {% endset %}
    {% set num_periods_dict = automate_dv.get_query_results_as_dict(num_periods_check_sql) %}
    {% set num_periods = num_periods_dict['NUM_PERIODS'][0] | int %}

    {% do return(num_periods) %}

{% endmacro %}