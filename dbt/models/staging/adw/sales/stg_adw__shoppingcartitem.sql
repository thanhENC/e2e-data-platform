with source as (
      select * from {{ source('source_adw_sales', 'abshoppingcartitem') }}
),
renamed as (
    select
        {{ adapter.quote("QUANTITY") }},
        {{ adapter.quote("PRODUCTID") }},
        {{ adapter.quote("DATECREATED") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("SHOPPINGCARTID") }},
        {{ adapter.quote("SHOPPINGCARTITEMID") }}

    from source
)
select * from renamed
  