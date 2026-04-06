{{ config(materialized='table') }}

with source as (
    select * from {{ source('thelook_ecommerce', 'products') }}
)

select
    id as product_id,
    cost,
    retail_price,
    category,
    brand,
    name as product_name
from source