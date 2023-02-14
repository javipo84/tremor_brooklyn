WITH stg_tpch_sf1_customers AS (
    SELECT 
        C_CUSTKEY,
        C_NATIONKEY
    FROM {{ ref ('stg_tpch_sf1__customer') }}
),
stg_tpch_sf1_lineitem AS (
    SELECT 
        L_ORDERKEY,
        L_PARTKEY,
        L_SHIPMODE,
        L_SHIPDATE
    FROM {{ ref ('stg_tpch_sf1__lineitem') }}
),
stg_tpch_sf1_nation AS (
    SELECT 
        N_NATIONKEY,
        N_REGIONKEY,
        N_NAME
    FROM {{ ref ('stg_tpch_sf1__nation') }}
),
stg_tpch_sf1_region AS (
    SELECT 
        R_REGIONKEY,
        R_NAME
    FROM {{ ref ('stg_tpch_sf1__region') }}
),
stg_tpch_sf1_orders AS (
    SELECT 
        O_ORDERKEY,
        O_CUSTKEY,
        O_ORDERDATE
    FROM {{ ref ('stg_tpch_sf1__orders') }}
),
agr_orders_year as (
    SELECT
        year(ORD.O_ORDERDATE) AS YEAR,
        COUNT(DISTINCT ORD.O_ORDERDATE) AS NUM_ORDERS
    FROM
        stg_tpch_sf1_customers CUS
        INNER JOIN stg_tpch_sf1_nation NAT ON CUS.C_NATIONKEY = NAT.N_NATIONKEY
        INNER JOIN stg_tpch_sf1_region REG ON NAT.N_REGIONKEY = REG.R_REGIONKEY
        INNER JOIN stg_tpch_sf1_orders ORD ON CUS.C_CUSTKEY = ORD.O_CUSTKEY
        INNER JOIN stg_tpch_sf1_lineitem LIN ON LIN.L_ORDERKEY = ORD.O_ORDERKEY
    GROUP BY
        year(ORD.O_ORDERDATE)
)

SELECT * FROM agr_orders_year
