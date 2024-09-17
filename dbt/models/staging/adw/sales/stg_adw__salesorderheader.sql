with source as (
      select * from {{ source('source_adw_sales', 'absalesorderheader') }}
),
renamed as (
    select
        {{ adapter.quote("STATUS") }},
        {{ adapter.quote("TAXAMT") }},
        {{ adapter.quote("COMMENT") }},
        {{ adapter.quote("DUEDATE") }},
        {{ adapter.quote("FREIGHT") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("SHIPDATE") }},
        {{ adapter.quote("SUBTOTAL") }},
        {{ adapter.quote("TOTALDUE") }},
        {{ adapter.quote("ORDERDATE") }},
        {{ adapter.quote("CUSTOMERID") }},
        {{ adapter.quote("TERRITORYID") }},
        {{ adapter.quote("CREDITCARDID") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SALESORDERID") }},
        {{ adapter.quote("SHIPMETHODID") }},
        {{ adapter.quote("ACCOUNTNUMBER") }},
        {{ adapter.quote("SALESPERSONID") }},
        {{ adapter.quote("CURRENCYRATEID") }},
        {{ adapter.quote("REVISIONNUMBER") }},
        {{ adapter.quote("BILLTOADDRESSID") }},
        {{ adapter.quote("ONLINEORDERFLAG") }},
        {{ adapter.quote("SHIPTOADDRESSID") }},
        {{ adapter.quote("PURCHASEORDERNUMBER") }},
        {{ adapter.quote("CREDITCARDAPPROVALCODE") }}

    from source
)
select * from renamed
  