
  WITH source_orders AS (
    SELECT
        o_orderkey,
        o_custkey,
        o_orderstatus,
        o_totalprice,
        o_orderdate,
        o_orderpriority,
        o_clerk,
        o_shippriority,
        o_comment
    FROM {{ source('tpch_sf1', 'v_orders') }}
  ),

  rename_casted_stg_orders AS (
    SELECT
        o_orderkey,
        o_custkey,
        o_orderstatus,
        o_totalprice,
        o_orderdate,
        o_orderpriority,
        o_clerk,
        o_shippriority,
        o_comment
    FROM source_orders
  )

  SELECT * FROM rename_casted_stg_orders