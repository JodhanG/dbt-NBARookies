{{ config(materialized='view') }}

select * from {{ source('staging', 'rookie_season_totals') }}

