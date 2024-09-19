with source as (
      select * from {{ source('source_adw_person', 'pe_stateprovince') }}
),
renamed as (
    select
        {{ adapter.quote("STATEPROVINCEID") }} as state_province_id,
        {{ adapter.quote("STATEPROVINCECODE") }} as state_province_code,
        {{ adapter.quote("COUNTRYREGIONCODE") }} as country_region_code,
        {{ adapter.quote("ISONLYSTATEPROVINCEFLAG") }} as is_only_state_province_flag,
        {{ adapter.quote("NAME") }} as name,
        {{ adapter.quote("TERRITORYID") }} as territory_id,
        {{ adapter.quote("ROWGUID") }} as row_guid,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed