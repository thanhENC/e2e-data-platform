with source as (
      select * from {{ source('source_adw_sales', 'sa_salesorderheadersalesreason') }}
),
renamed as (
    select
        {{ adapter.quote("SALESORDERID") }} as sales_order_id,
        {{ adapter.quote("SALESREASONID") }} as sales_reason_id,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  