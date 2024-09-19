with source as (
      select * from {{ source('source_adw_sales', 'sa_salespersonquotahistory') }}
),
renamed as (
    select
        {{ adapter.quote("businessentityid") }} as business_entity_id,
        {{ adapter.quote("quotadate") }} as quota_date,
        {{ adapter.quote("salesquota") }} as sales_quota,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  