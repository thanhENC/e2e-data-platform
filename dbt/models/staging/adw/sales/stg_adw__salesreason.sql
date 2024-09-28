with source as (
      select * from {{ source('source_adw_sales', 'sa_salesreason') }}
),
renamed as (
    select
        {{ adapter.quote("salesreasonid") }} as sales_reason_id,
        {{ adapter.quote("name") }} as name,
        {{ adapter.quote("reasontype") }} as reason_type,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  