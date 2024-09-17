with final as (
    select * from {{ ref('stg_adw__customer') }}
)

select * from final