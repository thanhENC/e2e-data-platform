with source as (
      select * from {{ source('source_adw_sales', 'abcustomer') }}
),
renamed as (
    select
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("STOREID") }},
        {{ adapter.quote("PERSONID") }},
        {{ adapter.quote("CUSTOMERID") }},
        {{ adapter.quote("TERRITORYID") }},
        {{ adapter.quote("MODIFIEDDATE") }}

    from source
)
select * from renamed
