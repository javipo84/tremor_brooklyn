
  WITH source_nation AS (
    SELECT
        n_nationkey,
        n_name,
        n_regionkey,
        n_comment
    FROM {{ source('tpch_sf1', 'v_nation') }}
  ),

  rename_casted_stg_nation AS (
    SELECT
        n_nationkey,
        n_name,
        n_regionkey,
        n_comment
    FROM source_nation
  )

  SELECT * FROM rename_casted_stg_nation