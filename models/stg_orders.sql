{{ config(materialized='table') }}

with source as (
    select * from {{ source('thelook_ecommerce', 'orders') }}
)

select
    order_id,
    user_id,
    status,
    created_at,
    returned_at,
    shipped_at,
    delivered_at,
    num_of_item as total_items,
    -- Nuevo campo para ver el cambio en GitHub:
    status = 'Shipped' as is_shipped
from source