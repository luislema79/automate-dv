WITH stage AS (
    SELECT *

    FROM [DATABASE_NAME].[SCHEMA_NAME].raw_source
),

derived_columns AS (
    SELECT

    BOOKING_FK,
    ORDER_FK,
    CUSTOMER_PK,
    CUSTOMER_ID,
    LOADDATE,
    RECORD_SOURCE,
    CUSTOMER_DOB,
    CUSTOMER_NAME,
    NATIONALITY,
    PHONE,
    TEST_COLUMN_2,
    TEST_COLUMN_3,
    TEST_COLUMN_4,
    TEST_COLUMN_5,
    TEST_COLUMN_6,
    TEST_COLUMN_7,
    TEST_COLUMN_8,
    TEST_COLUMN_9,
    BOOKING_DATE,
    'STG_BOOKING' AS SOURCE,
    BOOKING_DATE AS EFFECTIVE_FROM

    FROM stage
),

hashed_columns AS (
    SELECT *

    FROM derived_columns
)

SELECT * FROM hashed_columns