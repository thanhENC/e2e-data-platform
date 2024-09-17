with source as (
      select * from {{ source('source_adw_sales', 'abspecialoffer') }}
),
renamed as (
    select
        {{ adapter.quote("TYPE") }},
        {{ adapter.quote("MAXQTY") }},
        {{ adapter.quote("MINQTY") }},
        {{ adapter.quote("ENDDATE") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("CATEGORY") }},
        {{ adapter.quote("STARTDATE") }},
        {{ adapter.quote("DESCRIPTION") }},
        {{ adapter.quote("DISCOUNTPCT") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SPECIALOFFERID") }}

    from source
)
select * from renamed
  