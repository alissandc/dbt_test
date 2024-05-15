with item_liquors as (

    select * from {{ ref('dim_liquor_itemized') }}

),

stores as (

    select * from {{ ref('dim_stores_and_location') }}

)

SELECT 
    src.invoice_and_item_number, 
    src.date as invoice_created_date,

    stores.store_number,
    stores.store_name,
    stores.address,
    stores.city,
    stores.zip_code,
    stores.county,

    item_liquors.item_number, 
    item_liquors.category_id,
    item_liquors.item_description,
    item_liquors.vendor_id,
    item_liquors.vendor_name,

    src.pack as bottle_pack, 
    src.bottle_volume_ml, 
    src.state_bottle_cost, 
    src.state_bottle_retail, 
    src.bottles_sold, 
    src.sale_dollars,
    (src.sale_dollars - src.state_bottle_cost) as profit,  
    src.volume_sold_liters, 
    src.volume_sold_gallons
from {{ source('iowa_liquor_store', 'sales') }} as src
join item_liquors ON src.item_number = item_liquors.item_number
join stores ON src.store_number = stores.store_number