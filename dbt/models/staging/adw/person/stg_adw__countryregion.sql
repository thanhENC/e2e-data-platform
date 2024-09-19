with source as (
      select * from {{ source('source_adw_person', 'pe_countryregion') }}
),
renamed as (
    select
        {{ adapter.quote("COUNTRYREGIONCODE") }} as country_region_code,
        {{ adapter.quote("NAME") }} as name,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  