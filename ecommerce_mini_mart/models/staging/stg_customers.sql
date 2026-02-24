select
  cast(customer_id as integer) as customer_id,
  cast(created_at as date) as created_at,
  upper(country) as country
from {{ ref('customers') }}
