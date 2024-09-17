with source as (
      select * from {{ source('source_adw_person', 'abaddresstype') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("ADDRESSTYPEID") }}

    from source
)
select * from renamed
  