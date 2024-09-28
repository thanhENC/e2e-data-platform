with source as (
      select * from {{ source('source_adw_person', 'pe_addresstype') }}
),
renamed as (
    select
        {{ adapter.quote("ADDRESSTYPEID") }} as address_type_id,
        {{ adapter.quote("NAME") }} as name,
        {{ adapter.quote("ROWGUID") }} as row_guid,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  