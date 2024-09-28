with source as (
      select * from {{ source('source_adw_sales', 'sa_salesperson') }}
),
renamed as (
    select
        {{ adapter.quote("businessentityid") }} as business_entity_id,
        {{ adapter.quote("territoryid") }} as territory_id,
        {{ adapter.quote("salesquota") }} as sales_quota,
        {{ adapter.quote("bonus") }} as bonus,
        {{ adapter.quote("commissionpct") }} as commission_percent,
        {{ adapter.quote("salesytd") }} as sales_ytd,
        {{ adapter.quote("saleslastyear") }} as sales_last_year,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  