with source as (
      select * from {{ source('source_adw_person', 'abpassword') }}
),
renamed as (
    select
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("PASSWORDHASH") }},
        {{ adapter.quote("PASSWORDSALT") }},
        {{ adapter.quote("BUSINESSENTITYID") }}

    from source
)
select * from renamed
  