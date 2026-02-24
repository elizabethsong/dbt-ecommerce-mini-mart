with customers as (
  select * from {{ ref('stg_customers') }}
),
orders as (
  select * from {{ ref('stg_orders') }}
),
customer_rollup as (
  select
    customer_id,
    min(order_date) as first_order_date,
    count(*) as order_count,
    sum(case when status = 'completed' then total_amount else 0 end) as lifetime_value
  from orders
  group by 1
)

select
  c.customer_id,
  c.created_at,
  c.country,
  r.first_order_date,
  r.order_count,
  r.lifetime_value
from customers c
left join customer_rollup r using (customer_id)
