with source as (
      select * from {{ source('source_adw_production', 'pr_product') }}
),
renamed as (
    select
        {{ adapter.quote("productid") }} as product_id,
        {{ adapter.quote("name") }} as product_name,
        {{ adapter.quote("productnumber") }} as product_number,
        {{ adapter.quote("makeflag") }} as make_flag,
        {{ adapter.quote("finishedgoodsflag") }} as finished_goods_flag,
        {{ adapter.quote("color") }} as color,
        {{ adapter.quote("safetystocklevel") }} as safety_stock_level,
        {{ adapter.quote("reorderpoint") }} as reorder_point,
        cast( {{ adapter.quote("standardcost") }} as DECIMAL(20, 4) ) as standard_cost,
        cast( {{ adapter.quote("listprice") }} as DECIMAL(20, 4) ) as list_price,
        {{ adapter.quote("size") }} as "size",
        trim( {{ adapter.quote("sizeunitmeasurecode") }} ) as size_unit_measure_code,
        trim( {{ adapter.quote("weightunitmeasurecode") }} ) as weight_unit_measure_code,
        cast( {{ adapter.quote("weight") }} as DECIMAL(8, 2) ) as "weight",
        {{ adapter.quote("daystomanufacture") }} as days_to_manufacture,
        trim( {{ adapter.quote("productline") }} ) as product_line,
        trim( {{ adapter.quote("class") }} ) as class,
        trim( {{ adapter.quote("style") }} ) as style,
        {{ adapter.quote("productsubcategoryid") }} as product_subcategory_id,
        {{ adapter.quote("productmodelid") }} as product_model_id,
        {{ adapter.quote("sellstartdate") }} as sell_start_date,
        {{ adapter.quote("sellenddate") }} as sell_end_date,
        {{ adapter.quote("discontinueddate") }} as discountinued_date,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  