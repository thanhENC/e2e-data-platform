with source as (
      select * from {{ source('source_adw_person', 'abpersonphone') }}
),
renamed as (
    select
        {{ adapter.quote("PHONENUMBER") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("BUSINESSENTITYID") }},
        {{ adapter.quote("PHONENUMBERTYPEID") }}

    from source
)
select * from renamed
  