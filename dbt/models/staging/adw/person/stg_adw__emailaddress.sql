with source as (
      select * from {{ source('source_adw_person', 'abemailaddress') }}
),
renamed as (
    select
        {{ adapter.quote("_AIRBYTE_RAW_ID") }},
        {{ adapter.quote("_AIRBYTE_EXTRACTED_AT") }},
        {{ adapter.quote("_AIRBYTE_META") }},
        {{ adapter.quote("_AIRBYTE_GENERATION_ID") }},
        {{ adapter.quote("ROWGUID") }},
        {{ adapter.quote("EMAILADDRESS") }},
        {{ adapter.quote("MODIFIEDDATE") }},
        {{ adapter.quote("EMAILADDRESSID") }},
        {{ adapter.quote("BUSINESSENTITYID") }}

    from source
)
select * from renamed
  