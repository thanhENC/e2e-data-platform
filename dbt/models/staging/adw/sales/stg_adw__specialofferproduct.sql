with source as (
      select * from {{ source('source_adw_sales', 'sa_specialofferproduct') }}
),
renamed as (
    select
        {{ adapter.quote("specialofferid") }} as special_offer_id,
        {{ adapter.quote("productid") }} as product_id,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  