with source as (
      select * from {{ source('source_adw_sales', 'sa_currencyrate') }}
),
renamed as (
    select
        {{ adapter.quote("currencyrateid") }} as currency_rate_id,
        {{ adapter.quote("currencyratedate") }} as currency_rate_date,
        {{ adapter.quote("fromcurrencycode") }} as from_currency_code,
        {{ adapter.quote("tocurrencycode") }} as to_currency_code,
        {{ adapter.quote("averagerate") }} as average_rate,
        {{ adapter.quote("endofdayrate") }} as end_of_day_rate,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  