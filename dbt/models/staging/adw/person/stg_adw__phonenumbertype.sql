with source as (
      select * from {{ source('source_adw_person', 'abphonenumbertype') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("PHONENUMBERTYPEID") }}

    from source
)
select * from renamed
  