/*
 * Copyright (c) Business Thinking Ltd. 2019-2022
 * This software includes code developed by the dbtvault Team at Business Thinking Ltd. Trading as Datavault
 */

{%- macro extract_null_column_names(columns_dict=none) -%}

    {%- set extracted_column_names = [] -%}

    {%- if columns_dict is mapping -%}
        {%- for key, value in columns_dict.items() -%}
            {%- if dbtvault.is_something(value) -%}
                {% if dbtvault.is_list(value) %}
                    {% for col_name in value %}
                        {%- do extracted_column_names.append(col_name) -%}
                        {%- do extracted_column_names.append(col_name ~ "_ORIGINAL") -%}
                    {% endfor %}
                {%  else %}
                    {%- do extracted_column_names.append(value) -%}
                    {%- do extracted_column_names.append(value ~ "_ORIGINAL") -%}
                {% endif %}
            {%- endif -%}
        {%- endfor -%}

        {%- do return(extracted_column_names) -%}
    {%- else -%}
        {%- do return([]) -%}
    {%- endif -%}

{%- endmacro -%}