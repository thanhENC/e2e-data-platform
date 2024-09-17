with source as (
      select * from {{ source('source_adw_person', 'abcountryregion') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("COUNTRYREGIONCODE") }}

    from source
)
select * from renamed
  