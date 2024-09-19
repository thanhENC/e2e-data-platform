with source as (
      select * from {{ source('source_adw_sales', 'sa_currency') }}
),
renamed as (
    select
        {{ adapter.quote("CURRENCYCODE") }} as currency_code,
        {{ adapter.quote("NAME") }} as name,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
