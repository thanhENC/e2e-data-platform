-- fact_sales

with final as (
    select 
        {{ dbt_utils.generate_surrogate_key(['s.sales_order_id', 's.sales_order_detail_id']) }} as sales_key,
        s.sales_order_id,
        row_number() over (partition by s.sales_order_id order by s.sales_order_detail_id) as sales_order_detail_id,
        s.order_date,
        s.online_order_flag,
        c.customer_key,
        p.product_key,
        {# s.standard_cost, #}
        s.order_quantity,
        s.unit_price,
        s.unit_price_percent_discount,
        s.line_total,
        s.total_product_cost,
        s.tax_amount,
        s.sub_total,
        s.shipping_cost,
        s.total_due
    from {{ ref('int_sales_salesorderdetail') }} as s
    join {{ ref('dim_customers') }} as c
    on s.customer_id = c.customer_id
    join {{ ref('dim_products') }} as p
    on s.product_id = p.product_id
)

select * from final