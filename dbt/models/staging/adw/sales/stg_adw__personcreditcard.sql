with source as (
      select * from {{ source('source_adw_sales', 'sa_personcreditcard') }}
),
renamed as (
    select
        {{ adapter.quote("BUSINESSENTITYID") }} as business_entity_id,
        {{ adapter.quote("CREDITCARDID") }} as credit_card_id,
        {{ adapter.quote("MODIFIEDDATE") }} as modified_date

    from source
)
select * from renamed
  