with source as (
      select * from {{ source('source_adw_person', 'abbusinessentityaddress') }}
),
renamed as (
    select
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("ADDRESSID") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("ADDRESSTYPEID") }},
        {{ adapter.quote("BUSINESSENTITYID") }}

    from source
)
select * from renamed
  