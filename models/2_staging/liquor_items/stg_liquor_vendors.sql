SELECT 
    DISTINCT vendor_number as vendor_id,
    vendor_name
from {{ source('iowa_liquor_store', 'sales') }}