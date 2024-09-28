with source as (
      select * from {{ source('source_adw_person', 'pe_contacttype') }}
),
renamed as (
    select
        {{ adapter.quote("CONTACTTYPEID") }} as contact_type_id,
        {{ adapter.quote("NAME") }} as name,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  