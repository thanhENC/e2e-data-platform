with source as (
      select
        *, 
        CAST( {{ adapter.quote("unitprice") }} as DECIMAL(20, 3) ) as decimal_unit_price,
        CAST( {{ adapter.quote("unitpricediscount") }} as DECIMAL(10, 3) ) as decimal_unit_price_discount
      from {{ source('source_adw_sales', 'sa_salesorderdetail') }}
),

renamed as (
    select
        {{ adapter.quote("salesorderid") }} as sales_order_id,
        {{ adapter.quote("salesorderdetailid") }} as sales_order_detail_id,
        {{ adapter.quote("carriertrackingnumber") }} as carrier_tracking_number,
        {{ adapter.quote("orderqty") }} as order_quantity,
        {{ adapter.quote("productid") }} as product_id,
        {{ adapter.quote("specialofferid") }} as special_offer_id,
        {{ adapter.quote("decimal_unit_price") }} as unit_price,
        {{ adapter.quote("decimal_unit_price_discount") }} as unit_price_percent_discount,
        CAST( decimal_unit_price * ( 1.0 - decimal_unit_price_discount ) * orderqty as DECIMAL(20, 3) ) as line_total,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  