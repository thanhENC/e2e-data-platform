with source as (
      select * from {{ source('source_adw_sales', 'absalesterritoryhistory') }}
),
renamed as (
    select
        {{ adapter.quote("ENDDATE") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("STARTDATE") }},
        {{ adapter.quote("TERRITORYID") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("BUSINESSENTITYID") }}

    from source
)
select * from renamed
  