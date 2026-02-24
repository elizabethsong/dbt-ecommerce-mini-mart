with orders as (
  select * from {{ ref('stg_orders') }}
),
payments as (
  select
    order_id,
    sum(amount) as total_paid
  from {{ ref('stg_payments') }}
  group by 1
)

select
  o.order_id,
  o.customer_id,
  o.order_date,
  o.status,
  o.total_amount,
  coalesce(p.total_paid, 0) as total_paid,
  case when coalesce(p.total_paid, 0) >= o.total_amount and o.status = 'completed' then true else false end as is_fully_paid
from orders o
left join payments p using (order_id)
