# dbt-ecommerce-mini-mart
Produce analytics-ready layer from ecommerce tables



A small dbt project that transforms raw mock ecommerce data into analytics-ready staging + mart models, with tests and published documentation.
## Live documentation
- https://elizabethsong.github.io/dbt-ecommerce-mini-mart/

## Models
**Seeds (raw inputs)**
- customers, orders, payments

**Staging (views)**
- stg_customers
- stg_orders
- stg_payments

**Marts (tables)**
- dim_customers
- fct_orders

## Quality checks
- primary key uniqueness + not null tests
- referential integrity tests (relationships)

## Run locally
```bash
dbt seed --full-refresh
dbt build
dbt docs generate && dbt docs serve

