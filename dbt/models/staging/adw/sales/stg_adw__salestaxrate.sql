with source as (
      select * from {{ source('source_adw_sales', 'sa_salestaxrate') }}
),
renamed as (
    select
        {{ adapter.quote("salestaxrateid") }} as sales_tax_rate_id,
        {{ adapter.quote("stateprovinceid") }} as state_province_id,
        {{ adapter.quote("taxtype") }} as tax_type,
        {{ adapter.quote("taxrate") }} as tax_rate,
        {{ adapter.quote("name") }} as name,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  