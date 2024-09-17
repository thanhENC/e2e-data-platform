with source as (
      select * from {{ source('source_adw_person', 'abperson') }}
),
renamed as (
    select
        {{ adapter.quote("TITLE") }},
        {{ adapter.quote("SUFFIX") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("LASTNAME") }},
        {{ adapter.quote("FIRSTNAME") }},
        {{ adapter.quote("NAMESTYLE") }},
        {{ adapter.quote("MIDDLENAME") }},
        {{ adapter.quote("PERSONTYPE") }},
        {{ adapter.quote("DEMOGRAPHICS") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("EMAILPROMOTION") }},
        {{ adapter.quote("BUSINESSENTITYID") }},
        {{ adapter.quote("ADDITIONALCONTACTINFO") }}

    from source
)
select * from renamed
  