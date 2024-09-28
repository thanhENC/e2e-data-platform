with source as (
      select * from {{ source('source_adw_sales', 'sa_specialoffer') }}
),
renamed as (
    select
        {{ adapter.quote("specialofferid") }} as special_offer_id,
        {{ adapter.quote("description") }} as description,
        {{ adapter.quote("discountpct") }} as discount_percent,
        {{ adapter.quote("type") }} as type,
        {{ adapter.quote("category") }} as category,
        {{ adapter.quote("startdate") }} as start_date,
        {{ adapter.quote("enddate") }} as end_date,
        {{ adapter.quote("minqty") }} as min_quantity,
        {{ adapter.quote("maxqty") }} as max_quantity,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  