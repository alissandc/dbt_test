SELECT 
    DISTINCT category as category_id,
    category_name
from {{ source('iowa_liquor_store', 'sales') }}