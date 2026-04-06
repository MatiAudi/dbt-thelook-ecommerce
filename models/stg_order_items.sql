{{ config(materialized='table') }}

select
    id as order_item_id,
    order_id,
    product_id,
    sale_price,
    created_at
from {{ source('thelook_ecommerce', 'order_items') }}