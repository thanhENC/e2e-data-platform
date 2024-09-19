with source as (
      select * from {{ source('source_adw_sales', 'sa_customer') }}
),
renamed as (
    select
        {{ adapter.quote("CUSTOMERID") }} as customer_id,
        {{ adapter.quote("PERSONID") }} as person_id,
        {{ adapter.quote("STOREID") }} as store_id,
        {{ adapter.quote("TERRITORYID") }} as territory_id,
        {{ adapter.quote("ROWGUID") }} as row_guid,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
