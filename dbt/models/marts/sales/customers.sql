with final as (
    select * from {{ ref('int_sales_customers') }}
)

select * from final