with source as (
      select * from {{ source('source_adw_sales', 'sa_salesterritoryhistory') }}
),
renamed as (
    select
        {{ adapter.quote("businessentityid") }} as business_entity_id,
        {{ adapter.quote("territoryid") }} as territory_id,
        {{ adapter.quote("startdate") }} as start_date,
        {{ adapter.quote("enddate") }} as end_date,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  