-- int_sales_salesorderdetail

with sales_order_detail as (
    select 
        odetail.sales_order_id,
        odetail.sales_order_detail_id,
        cast( oheader.order_date as date ) as order_date,
        oheader.online_order_flag,
        oheader.customer_id,
        odetail.product_id,
        pr.standard_cost,
        odetail.order_quantity,
        odetail.unit_price,
        odetail.unit_price_percent_discount,
        odetail.line_total,
        odetail.order_quantity * pr.standard_cost as total_product_cost,
        oheader.tax_amount,
        {# odetail.line_total + oheader.tax_amount as sub_total, #}
        oheader.sub_total,
        oheader.freight as shipping_cost,
        oheader.total_due
    from {{ ref('stg_adw__salesorderdetail') }} as odetail
    join {{ ref('stg_adw__salesorderheader') }} as oheader
    on odetail.sales_order_id = oheader.sales_order_id
    join {{ ref('stg_adw__product') }} as pr
    on odetail.product_id = pr.product_id
)

select * from sales_order_detail