with stores as (

    select * from {{ ref('stg_stores') }}

),

geolocation as (

    select * from {{ ref('stg_location') }}

)

SELECT 
  DISTINCT stores.store_number,
  stores.store_name,
  stores.address,
  stores.city,
  stores.zip_code,
  stores.county,
  geolocation.loc_store_location g_store_location
FROM stores
LEFT JOIN geolocation ON stores.store_number = geolocation.store_number
