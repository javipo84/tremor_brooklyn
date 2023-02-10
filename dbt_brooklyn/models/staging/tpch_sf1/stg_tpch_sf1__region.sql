  WITH source_region AS (
    SELECT
        r_regionkey,
        r_name,
        r_comment
    FROM {{ source('tpch_sf1', 'v_region') }}
  ),

  rename_casted_stg_region AS (
    SELECT
        r_regionkey,
        r_name,
        r_comment
    FROM source_region
  )

  SELECT * FROM rename_casted_stg_region