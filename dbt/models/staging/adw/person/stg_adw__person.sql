with source as (
      select * from {{ source('source_adw_person', 'pe_person') }}
),
renamed as (
    select
        {{ adapter.quote("BUSINESSENTITYID") }} as business_entity_id,
        {{ adapter.quote("PERSONTYPE") }} as person_type,
        {{ adapter.quote("NAMESTYLE") }} as name_style,
        {{ adapter.quote("TITLE") }} as title,
        {{ adapter.quote("FIRSTNAME") }} as first_name,
        {{ adapter.quote("MIDDLENAME") }} as middle_name,
        {{ adapter.quote("LASTNAME") }} as last_name,
        {{ adapter.quote("SUFFIX") }} as suffix,
        {{ adapter.quote("EMAILPROMOTION") }} as email_promotion,
        {{ adapter.quote("ADDITIONALCONTACTINFO") }} as additional_contact_info,
        {{ adapter.quote("DEMOGRAPHICS") }} as demographics,
        {{ adapter.quote("ROWGUID") }} as row_guid,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  