with source as (
      select * from {{ source('source_adw_production', 'pr_productsubcategory') }}
),
renamed as (
    select
        {{ adapter.quote("productsubcategoryid") }} as product_subcategory_id,
        {{ adapter.quote("productcategoryid") }} as product_category_id,
        {{ adapter.quote("name") }} as subcategory_name,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  