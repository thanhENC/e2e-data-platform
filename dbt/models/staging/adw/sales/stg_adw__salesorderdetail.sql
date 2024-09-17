with source as (
      select * from {{ source('source_adw_sales', 'absalesorderdetail') }}
),
renamed as (
    select
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("ORDERQTY") }},
        {{ adapter.quote("PRODUCTID") }},
        {{ adapter.quote("UNITPRICE") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SALESORDERID") }},
        {{ adapter.quote("SPECIALOFFERID") }},
        {{ adapter.quote("UNITPRICEDISCOUNT") }},
        {{ adapter.quote("SALESORDERDETAILID") }},
        {{ adapter.quote("CARRIERTRACKINGNUMBER") }}

    from source
)
select * from renamed
  