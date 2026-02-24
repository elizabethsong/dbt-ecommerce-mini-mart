select
  cast(payment_id as integer) as payment_id,
  cast(order_id as integer) as order_id,
  cast(payment_date as date) as payment_date,
  cast(amount as double) as amount,
  lower(payment_method) as payment_method
from {{ ref('payments') }}
