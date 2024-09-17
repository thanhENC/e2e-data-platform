with source as (
      select * from {{ source('source_adw_sales', 'abpersoncreditcard') }}
),
renamed as (
    select
        {{ adapter.quote("CREDITCARDID") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("BUSINESSENTITYID") }}

    from source
)
select * from renamed
  