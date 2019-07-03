{{config(
	schema='STG',
	materialized='view',
	enabled=true
)}}

SELECT 
	MD5(UPPER(TRIM(CAST(a.ORDERKEY AS VARCHAR)))) AS ORDER_PK,
	MD5(UPPER(TRIM(CAST(a.PARTKEY AS VARCHAR)))) AS PART_PK,
	MD5(UPPER(TRIM(CAST(a.SUPPLIERKEY AS VARCHAR)))) AS SUPPLIER_PK,
	MD5(UPPER(TRIM(CAST(a.LINENUMBER AS VARCHAR)))) AS LINEITEM_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.QUANTITY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.EXTENDEDPRICE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.DISCOUNT AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.TAX AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.RETURNFLAG AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.LINESTATUS AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SHIPDATE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.COMMITDATE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.RECEIPTDATE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SHIPINSTRUCT AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SHIPMODE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.LINE_COMMENT AS VARCHAR))), '^^'))) AS LINEITEM_HASHDIFF,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.LINENUMBER AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.ORDERKEY AS VARCHAR))), '^^'))) AS LINEITEM_ORDER_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.ORDERSTATUS AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.TOTALPRICE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.ORDERDATE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.ORDERPRIORITY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CLERK AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SHIPPRIORITY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.ORDER_COMMENT AS VARCHAR))), '^^'))) AS ORDER_HASHDIFF,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.ORDERKEY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMERKEY AS VARCHAR))), '^^'))) AS ORDER_CUSTOMER_PK,
	MD5(UPPER(TRIM(CAST(a.CUSTOMERKEY AS VARCHAR)))) AS CUSTOMER_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMERKEY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_NATIONKEY AS VARCHAR))), '^^'))) AS CUSTOMERKEY_NATION_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_NAME AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_ADDRESS AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_PHONE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_ACCBAL AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_MKTSEGMENT AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_COMMENT AS VARCHAR))), '^^'))) AS CUSTOMER_HASHDIFF,
	MD5(UPPER(TRIM(CAST(a.CUSTOMER_NATIONKEY AS VARCHAR)))) AS CUSTOMER_NATIONKEY_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_NATION AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_NATION_COMMENT AS VARCHAR))), '^^'))) AS CUSTOMER_NATION_HASHDIFF,
	MD5(UPPER(TRIM(CAST(a.CUSTOMER_REGIONKEY AS VARCHAR)))) AS CUSTOMER_REGION_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_NATIONKEY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_REGIONKEY AS VARCHAR))), '^^'))) AS CUSTOMER_NATION_REGION_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_REGION_NAME AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.CUSTOMER_REGION_COMMENT AS VARCHAR))), '^^'))) AS CUSTOMER_REGION_HASHDIFF,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.AVAILQTY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SUPPLYCOST AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.PARTSUPPLY_COMMENT AS VARCHAR))), '^^'))) AS PARTSUPP_HASHDIFF,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.LINENUMBER AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.PARTKEY AS VARCHAR))), '^^'))) AS LINEITEM_PARTSUPP_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.PART_NAME AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.MFGR AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.PART_BRAND AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.PART_TYPE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.PART_SIZE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.PART_CONTAINER AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.PART_RETAILPRICE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.PART_COMMENT AS VARCHAR))), '^^'))) AS PART_HASHDIFF,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.PARTKEY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIERKEY AS VARCHAR))), '^^'))) AS PART_SUPPLIER_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIERKEY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_NATIONKEY AS VARCHAR))), '^^'))) AS SUPPLIERKEY_NATION_PK,
	MD5(UPPER(TRIM(CAST(a.SUPPLIER_NATIONKEY AS VARCHAR)))) AS SUPPLIER_NATION_PK,
	MD5(UPPER(TRIM(CAST(a.SUPPLIER_REGIONKEY)))) AS SUPPLIER_REGION_PK,
	md5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_NATIONKEY AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_REGIONKEY AS VARCHAR))), '^^'))) AS SUPPLIER_NATION_REGION_PK,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_NAME AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_ADDRESS AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_PHONE AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_ACCTBAL AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_COMMENT AS VARCHAR))), '^^'))) AS SUPPLIER_HASHDIFF,
  MD5(CONCAT(
    IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_NATION_NAME AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_NATION_COMMENT AS VARCHAR))), '^^'))) AS SUPPLIER_NATION_HASHDIFF,
  MD5(CONCAT(
    IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_REGION_NAME AS VARCHAR))), '^^'), '||',
    IFNULL(UPPER(TRIM(CAST(a.SUPPLIER_REGION_COMMENT AS VARCHAR))), '^^'))) AS SUPPLIER_REGION_HASHDIFF,
	MD5(CONCAT(
		IFNULL(UPPER(TRIM(CAST(a.LINENUMBER AS VARCHAR))), '^^'), '||',
		IFNULL(UPPER(TRIM(CAST(a.SUPPLIERKEY AS VARCHAR))), '^^'))) AS LINEITEM_SUPPLIER_PK,
	a.*,
	{{var("date")}} AS LOADDATE,
	{{var("date")}} AS EFFECTIVE_FROM,
	'TPCH' AS SOURCE,
  a.ORDERKEY AS o_key
FROM {{ref('source_system')}} AS a
ORDER BY a.ORDERKEY
LIMIT 20

