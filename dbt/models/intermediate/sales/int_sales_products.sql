-- int_sales_products.sql

with product_subcategory as (
    select 
        subcat.product_subcategory_id,
        subcat.subcategory_name,
        cat.category_name
    from {{ ref('stg_adw__productsubcategory') }} as subcat
    join {{ ref('stg_adw__productcategory') }} as cat
    on subcat.product_category_id = cat.product_category_id
),

final as (
    select
        pr.product_id,
        pr.product_name,
        pr.product_number,
        pr.make_flag,
        pr.color,
        {{ classify_color('pr.color') }} as color_category,
        pr.standard_cost,
        pr.list_price,
        pr.list_price - pr.standard_cost as product_max_gross_profit,
        {{ get_productline('pr.product_line') }} as product_line,
        {{ get_productclass('pr.class') }} as class,
        {{ get_productstyle('pr.style') }} as style,
        sub.subcategory_name,
        sub.category_name,
        pr.modified_date
    from {{ ref('stg_adw__product') }} as pr
    join product_subcategory as sub
    on pr.product_subcategory_id = sub.product_subcategory_id
)

select * from final