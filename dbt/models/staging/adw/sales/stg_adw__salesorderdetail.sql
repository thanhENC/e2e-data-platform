with source as (
      select * from {{ source('source_adw_sales', 'sa_salesorderdetail') }}
),
renamed as (
    select
        {{ adapter.quote("SALESORDERID") }} as sales_order_id,
        {{ adapter.quote("SALESORDERDETAILID") }} as sales_order_detail_id,
        {{ adapter.quote("CARRIERTRACKINGNUMBER") }} as carrier_tracking_number,
        {{ adapter.quote("ORDERQTY") }} as order_quantity,
        {{ adapter.quote("PRODUCTID") }} as product_id,
        {{ adapter.quote("SPECIALOFFERID") }} as special_offer_id,
        {{ adapter.quote("UNITPRICE") }} as unit_price,
        {{ adapter.quote("UNITPRICEDISCOUNT") }} as unit_price_discount,
        {{ adapter.quote("ROWGUID") }} as row_guid,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  