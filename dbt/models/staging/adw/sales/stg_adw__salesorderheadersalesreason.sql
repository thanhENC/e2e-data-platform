with source as (
      select * from {{ source('source_adw_sales', 'absalesorderheadersalesreason') }}
),
renamed as (
    select
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SALESORDERID") }},
        {{ adapter.quote("SALESREASONID") }}

    from source
)
select * from renamed
  