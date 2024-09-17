with source as (
      select * from {{ source('source_adw_person', 'abcontacttype') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("CONTACTTYPEID") }}

    from source
)
select * from renamed
  