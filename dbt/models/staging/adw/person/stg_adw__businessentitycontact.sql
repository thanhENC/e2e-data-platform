with source as (
      select * from {{ source('source_adw_person', 'abbusinessentitycontact') }}
),
renamed as (
    select
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("PERSONID") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("CONTACTTYPEID") }},
        {{ adapter.quote("BUSINESSENTITYID") }}

    from source
)
select * from renamed
  