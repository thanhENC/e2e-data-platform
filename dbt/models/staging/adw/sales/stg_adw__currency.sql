with source as (
      select * from {{ source('source_adw_sales', 'abcurrency') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("CURRENCYCODE") }},
        {{ adapter.quote("MODIFIEDDATE") }}

    from source
)
select * from renamed
