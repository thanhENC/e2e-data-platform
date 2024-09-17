with source as (
      select * from {{ source('source_adw_sales', 'abstore') }}
),
renamed as (
    select
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("DEMOGRAPHICS") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SALESPERSONID") }},
        {{ adapter.quote("BUSINESSENTITYID") }}

    from source
)
select * from renamed
  