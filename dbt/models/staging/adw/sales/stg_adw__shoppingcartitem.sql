with source as (
      select * from {{ source('source_adw_sales', 'sa_shoppingcartitem') }}
),
renamed as (
    select
        {{ adapter.quote("shoppingcartitemid") }} as shopping_cart_item_id,
        {{ adapter.quote("shoppingcartid") }} as shopping_cart_id,
        {{ adapter.quote("quantity") }} as quantity,
        {{ adapter.quote("productid") }} as product_id,
        {{ adapter.quote("datecreated") }} as date_created,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  