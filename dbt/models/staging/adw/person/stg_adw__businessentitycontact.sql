with source as (
      select * from {{ source('source_adw_person', 'pe_businessentitycontact') }}
),
renamed as (
    select
        {{ adapter.quote("BUSINESSENTITYID") }} as business_entity_id,
        {{ adapter.quote("PERSONID") }} as person_id,
        {{ adapter.quote("CONTACTTYPEID") }} as contact_type_id,
        {{ adapter.quote("ROWGUID") }} as row_guid,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  