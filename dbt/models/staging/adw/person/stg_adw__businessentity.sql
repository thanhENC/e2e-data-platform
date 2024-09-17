with source as (
      select * from {{ source('source_adw_person', 'abbusinessentity') }}
),
renamed as (
    select
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("BUSINESSENTITYID") }}

    from source
)
select * from renamed
  