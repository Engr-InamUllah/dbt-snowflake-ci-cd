select customer_id, min(order_date) first_order_date, max(order_date) latest_order_date,
       count(distinct order_id) order_count, sum(revenue) lifetime_value
from {{ ref('stg_orders') }} group by 1