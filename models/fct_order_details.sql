{{ config(materialized='table') }}

with items as (
    select * from {{ ref('stg_order_items') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),
products as (
    select * from {{ ref('stg_products') }}
)

select
    i.order_item_id,
    i.order_id,
    o.status,
    o.created_at,
    p.product_name,
    p.category,
    p.brand,
    i.sale_price,
    p.cost,
    i.sale_price - p.cost as profit_margin
from items i
left join orders o on i.order_id = o.order_id
left join products p on i.product_id = p.product_id