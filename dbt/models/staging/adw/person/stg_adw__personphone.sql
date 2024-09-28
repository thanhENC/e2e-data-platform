with source as (
      select * from {{ source('source_adw_person', 'pe_personphone') }}
),
renamed as (
    select
        {{ adapter.quote("BUSINESSENTITYID") }} as business_entity_id,
        {{ adapter.quote("PHONENUMBER") }} as phone_number,
        {{ adapter.quote("PHONENUMBERTYPEID") }} as phone_number_type_id,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  