with source as (
      select * from {{ source('source_adw_sales', 'sa_store') }}
),
renamed as (
    select
        {{ adapter.quote("businessentityid") }} as business_entity_id,
        {{ adapter.quote("name") }} as name,
        {{ adapter.quote("salespersonid") }} as sales_person_id,
        {{ adapter.quote("demographics") }} as demographics,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  