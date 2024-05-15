--Converts geography type to string for each store number
SELECT 
  DISTINCT store_number,
  ST_ASTEXT(store_location) loc_store_location
from {{ source('iowa_liquor_store', 'sales') }}
where store_location is not null