-- int_sales_customers.sql

with final as (
    select 
        cus.customer_id as customer_id,
        {{ get_persontype( 'per.person_type' ) }} as customer_type,
        per.first_name as first_name,
        per.middle_name as middle_name,
        per.last_name as last_name,
        {{ get_fullname( 'per.first_name', 'per.middle_name', 'per.last_name', 'per.name_style') }} as full_name,
        cus.modified_date as modified_date
    from {{ ref('stg_adw__customer') }} as cus
    join {{ ref('stg_adw__person') }} as per
    on cus.person_id = per.business_entity_id
)

select * from final