with source as (
      select * from {{ source('source_adw_sales', 'absalesterritory') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("GROUP") }},
        {{ adapter.quote("COSTYTD") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("SALESYTD") }},
        {{ adapter.quote("TERRITORYID") }},
        {{ adapter.quote("COSTLASTYEAR") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SALESLASTYEAR") }},
        {{ adapter.quote("COUNTRYREGIONCODE") }}

    from source
)
select * from renamed
  