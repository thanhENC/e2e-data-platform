with source as (
      select * from {{ source('source_adw_person', 'pe_password') }}
),
renamed as (
    select
        {{ adapter.quote("BUSINESSENTITYID") }} as business_entity_id,
        {{ adapter.quote("PASSWORDHASH") }} as password_hash,
        {{ adapter.quote("PASSWORDSALT") }} as password_salt,
        {{ adapter.quote("ROWGUID") }} as row_guid,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  