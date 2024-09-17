with source as (
      select * from {{ source('source_adw_sales', 'abcountryregioncurrency') }}
),
renamed as (
    select
        {{ adapter.quote("CURRENCYCODE") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("COUNTRYREGIONCODE") }}
        
    from source
)
select * from renamed
  