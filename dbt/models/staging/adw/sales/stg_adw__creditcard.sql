with source as (
      select * from {{ source('source_adw_sales', 'abcreditcard') }}
),
renamed as (
    select
        {{ adapter.quote("EXPYEAR") }},
        {{ adapter.quote("CARDTYPE") }},
        {{ adapter.quote("EXPMONTH") }},
        {{ adapter.quote("CARDNUMBER") }},
        {{ adapter.quote("CREDITCARDID") }},
        {{ adapter.quote("MODIFIEDDATE") }}

    from source
)
select * from renamed
