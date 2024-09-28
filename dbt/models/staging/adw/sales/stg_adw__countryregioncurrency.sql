with source as (
      select * from {{ source('source_adw_sales', 'sa_countryregioncurrency') }}
),
renamed as (
    select
        {{ adapter.quote("COUNTRYREGIONCODE") }} as country_region_code,
        {{ adapter.quote("CURRENCYCODE") }} as currency_code,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date
        
    from source
)
select * from renamed
  