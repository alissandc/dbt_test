SELECT 
  DISTINCT store_number,
  store_name,
  address,
  city,
  zip_code,
  county
from {{ source('iowa_liquor_store', 'sales') }}
where store_number IS NOT NULL