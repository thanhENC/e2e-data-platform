with source as (
      select * from {{ source('source_adw_sales', 'sa_salesorderheader') }}
),
renamed as (
    select
        {{ adapter.quote("salesorderid") }} as sales_order_id,
        {{ adapter.quote("revisionnumber") }} as revision_number,
        {{ adapter.quote("orderdate") }} as order_date,
        {{ adapter.quote("duedate") }} as due_date,
        {{ adapter.quote("shipdate") }} as ship_date,
        {{ adapter.quote("status") }} as status,
        {{ adapter.quote("onlineorderflag") }} as online_order_flag,
        {{ adapter.quote("purchaseordernumber") }} as purchase_order_number,
        {{ adapter.quote("accountnumber") }} as account_number,
        {{ adapter.quote("customerid") }} as customer_id,
        {{ adapter.quote("salespersonid") }} as sales_person_id,
        {{ adapter.quote("territoryid") }} as territory_id,
        {{ adapter.quote("billtoaddressid") }} as bill_to_address_id,
        {{ adapter.quote("shiptoaddressid") }} as ship_to_address_id,
        {{ adapter.quote("shipmethodid") }} as ship_method_id,
        {{ adapter.quote("creditcardid") }} as credit_card_id,
        {{ adapter.quote("creditcardapprovalcode") }} as credit_card_approval_code,
        {{ adapter.quote("currencyrateid") }} as currency_rate_id,
        {{ adapter.quote("subtotal") }} as sub_total,
        {{ adapter.quote("taxamt") }} as tax_amount,
        {{ adapter.quote("freight") }} as freight,
        {{ adapter.quote("totaldue") }} as total_due,
        {{ adapter.quote("comment") }} as comment,
        {{ adapter.quote("rowguid") }} as row_guid,
        {{ adapter.quote("modifieddate") }} as modified_date

    from source
)
select * from renamed
  