with source as (
      select * from {{ source('source_adw_person', 'pe_businessentity') }}
),
renamed as (
    select
        {{ adapter.quote("BUSINESSENTITYID") }} as business_entity_id,
        {{ adapter.quote("ROWGUID") }} as row_guid,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  