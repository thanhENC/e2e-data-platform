with source as (
      select * from {{ source('source_adw_sales', 'sa_salesterritory') }}
),
renamed as (
    select
        {{ adapter.quote("territoryid") }} as territory_id,
        {{ adapter.quote("name") }} as name,
        {{ adapter.quote("countryregioncode") }} as country_region_code,
        {{ adapter.quote("group") }} as "group",
        {{ adapter.quote("salesytd") }} as sales_ytd,
        {{ adapter.quote("saleslastyear") }} as sales_last_year,
        {{ adapter.quote("costytd") }} as cost_ytd,
        {{ adapter.quote("costlastyear") }} as cost_last_year,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  