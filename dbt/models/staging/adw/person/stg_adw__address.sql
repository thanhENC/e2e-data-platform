with source as (
      select * from {{ source('source_adw_person', 'abaddress') }}
),
renamed as (
    select
        {{ adapter.quote("CITY") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("ADDRESSID") }},
        {{ adapter.quote("POSTALCODE") }},
        {{ adapter.quote("ADDRESSLINE1") }},
        {{ adapter.quote("ADDRESSLINE2") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SPATIALLOCATION") }},
        {{ adapter.quote("STATEPROVINCEID") }}

    from source
)
select * from renamed
  