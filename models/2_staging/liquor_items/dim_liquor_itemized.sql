with vendors as (

    select * from {{ ref('stg_liquor_vendors') }}

),

categories as (

    select * from {{ ref('stg_liqour_categories') }}

)

SELECT 
    DISTINCT item_number,
    item_description,
    vendors.vendor_id,
    vendors.vendor_name,
    categories.category_id,
    categories.category_name
FROM {{ source('iowa_liquor_store', 'sales') }}
LEFT JOIN vendors ON vendor_number = vendors.vendor_id
LEFT JOIN categories ON category = categories.category_id