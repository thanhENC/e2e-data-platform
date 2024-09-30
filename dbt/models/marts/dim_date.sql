-- dim_date

{{
    config(
        materialized='table',
        on_table_exists='drop'
    )
}}

{# with 
    dates_raw as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2000-01-01' as date)",
        end_date="current_date + interval '2' year"
        )
    }}
) #}

with dates_raw as (
    {{ dbt_date.get_date_dimension("2000-01-01", "2014-12-31") }}
),

dates_modified as (
    select 
        date_day,
        prior_date_day,
        next_date_day,
        prior_year_date_day,
        -- is_day_off: Saturday and Sunday (in this project) + public holidays
        case
            when day_of_week_iso in (6, 7) then true
            else false
        end as is_day_off,
        -- is_double_day: 01/01, 02/02, 03/03, etc.
        case
            when day_of_month = month_of_year then true
            else false
        end as is_double_day,
        day_of_week_iso,
        day_of_week_name,
        day_of_week_name_short,
        day_of_month,
        day_of_year,
        week_of_year,
        month_of_year,
        month_name,
        month_name_short,
        quarter_of_year,
        year_number
    from dates_raw
)

select * from dates_modified