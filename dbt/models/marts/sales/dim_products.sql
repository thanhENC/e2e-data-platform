-- dim_products

with final as (
    select 
        {{ dbt_utils.generate_surrogate_key(['pr.product_id']) }} as product_key,
        pr.product_id,
        pr.product_name,
        pr.product_number,
        pr.make_flag,
        pr.color,
        pr.color_category,
        pr.standard_cost,
        pr.list_price,
        pr.product_max_gross_profit,
        pr.product_line,
        pr.class,
        pr.style,
        pr.subcategory_name,
        pr.category_name
    from {{ ref('int_sales_products') }} as pr
)

select * from final