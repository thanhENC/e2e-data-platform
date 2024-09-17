with source as (
      select * from {{ source('source_adw_person', 'abstateprovince') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("TERRITORYID") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("STATEPROVINCEID") }},
        {{ adapter.quote("COUNTRYREGIONCODE") }},
        {{ adapter.quote("STATEPROVINCECODE") }},
        {{ adapter.quote("ISONLYSTATEPROVINCEFLAG") }}

    from source
)
select * from renamed