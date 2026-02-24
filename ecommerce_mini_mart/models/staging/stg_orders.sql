select
  cast(order_id as integer) as order_id,
  cast(customer_id as integer) as customer_id,
  cast(order_date as date) as order_date,
  lower(status) as status,
  cast(total_amount as double) as total_amount
from {{ ref('orders') }}
