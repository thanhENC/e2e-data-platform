with source as (
      select * from {{ source('source_adw_production', 'pr_productcategory') }}
),
renamed as (
    select
        {{ adapter.quote("productcategoryid") }} as product_category_id,
        {{ adapter.quote("name") }} as category_name,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  