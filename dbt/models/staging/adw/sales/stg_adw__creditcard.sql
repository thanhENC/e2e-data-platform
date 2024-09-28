with source as (
      select * from {{ source('source_adw_sales', 'sa_creditcard') }}
),
renamed as (
    select
        {{ adapter.quote("CREDITCARDID") }} as credit_card_id,
        {{ adapter.quote("CARDTYPE") }} as card_type,
        {{ adapter.quote("CARDNUMBER") }} as card_number,
        {{ adapter.quote("EXPMONTH") }} as exp_month,
        {{ adapter.quote("EXPYEAR") }} as exp_year,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
