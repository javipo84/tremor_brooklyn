  WITH source_customer AS (
    SELECT
        c_custkey,
        c_name,
        c_address,
        c_nationkey,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment
    FROM {{ source('tpch_sf1', 'v_customer') }}
  ),

  rename_casted_stg_customer AS (
    SELECT
        c_custkey,
        c_name,
        c_address,
        c_nationkey,
        c_phone,
        c_acctbal,
        c_mktsegment,
        c_comment
    FROM source_customer
  )

  SELECT * FROM rename_casted_stg_customer