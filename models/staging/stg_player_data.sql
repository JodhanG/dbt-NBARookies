{{ config(materialized='view') }}

select * from {{ source('staging', 'player_per_game_totals') }}