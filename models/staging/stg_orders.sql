with source as (select * from {{ source('raw','orders') }}),
clean as (
 select cast(order_id as varchar) order_id, cast(customer_id as varchar) customer_id,
        cast(order_date as date) order_date, cast(quantity as integer) quantity,
        cast(unit_price as numeric(12,2)) unit_price
 from source where order_id is not null and quantity > 0 and unit_price >= 0
)
select *, quantity * unit_price as revenue from clean