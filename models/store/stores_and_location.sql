with stores as (

    select * from {{ ref('stores') }}

),

geolocation as (

    select * from {{ ref('location') }}

),

SELECT 
  store_number,
  store_name,
  address,
  city,
  zip_code,
  county,
  geolocation.store_location
FROM stores
LEFT JOIN geolocation ON store_number = geolocation.store_number
