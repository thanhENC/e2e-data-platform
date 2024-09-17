with source as (
      select * from {{ source('source_adw_sales', 'absalesreason') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("REASONTYPE") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SALESREASONID") }}

    from source
)
select * from renamed
  