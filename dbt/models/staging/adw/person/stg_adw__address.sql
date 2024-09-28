with source as (
      select * from {{ source('source_adw_person', 'pe_address') }}
),
renamed as (
    select
        {{ adapter.quote("ADDRESSID") }} as address_id,
        {{ adapter.quote("ADDRESSLINE1") }} as address_line_1,
        {{ adapter.quote("ADDRESSLINE2") }} as address_line_2,
        {{ adapter.quote("CITY") }} as city,
        {{ adapter.quote("STATEPROVINCEID") }} as state_province_id,
        {{ adapter.quote("POSTALCODE") }} as postal_code,
        {{ adapter.quote("SPATIALLOCATION") }} as spatial_location,
        {{ adapter.quote("ROWGUID") }} as row_id,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  