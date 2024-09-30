with final as (
    select 
        {{ dbt_utils.generate_surrogate_key(['cus.customer_id']) }} as customer_key,
        cus.customer_id,
        cus.customer_type,
        cus.full_name
    from {{ ref('int_sales_customers') }} as cus
)

select * from final