with vendors as (

    select * from {{ ref('liquor_vendors') }}

),

categories as (

    select * from {{ ref('liqour_categories') }}

),

SELECT 
    DISTINCT item_number,
    item_description,
    pack as item_pack,
    vendor_number,
    category as category_number
FROM `bigquery-public-data.iowa_liquor_sales.sales`
LEFT JOIN vendors ON vendor_number = vendors.vendor_id
LEFT JOIN categories ON category_number = categories.category_id