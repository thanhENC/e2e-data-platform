with source as (
      select * from {{ source('source_adw_sales', 'absalestaxrate') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("TAXRATE") }},
        {{ adapter.quote("TAXTYPE") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SALESTAXRATEID") }},
        {{ adapter.quote("STATEPROVINCEID") }}

    from source
)
select * from renamed
  