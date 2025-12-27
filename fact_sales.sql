-- fact_sales created
create table analytics_schema.fact_sales as
with join_table_cte as (
select
o.id as order_id,
o.customer_id as customer_id,
o.order_date::date as order_date,
o.order_status as order_status,
oi.id as order_item_id,
oi.product_id as product_id,
oi.quantity::int as quantity,
oi.unit_price::decimal(10, 2) as unit_price,
(oi.quantity * oi.unit_price)::decimal(10, 2) as gross_amount,
coalesce(oi.discounts, 0) as discounts,
((oi.quantity * oi.unit_price) - coalesce(oi.discounts, 0))::decimal(10, 2) as net_amount,
case 
	when coalesce(oi.discounts, 0) > 0 then 'Discounted'
	else 'Full Price'
end as discount_flag
from 
raw_schema.orders o join raw_schema.order_items oi on 
o.id = oi.order_id
)
select
order_id,
customer_id,
order_date,
order_status,
order_item_id,
product_id,
quantity,
unit_price,
gross_amount,
discounts,
net_amount,
discount_flag,
case 
    when quantity >= 10 then 'Bulk Order'
    when quantity >= 5 then 'Mid Size'
    when quantity >= 2 then 'Small Order'
    else 'Single Order'
end as order_size,
current_timestamp as loaded_at
from 
join_table_cte;
