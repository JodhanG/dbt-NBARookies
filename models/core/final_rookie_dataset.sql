{{ config(materialized='view') }}

{%- set common_rookie_cols = adapter.get_columns_in_relation(source('staging', 'rookie_season_totals')) -%}
{%- set common_player_cols = adapter.get_columns_in_relation(source('staging', 'player_per_game_totals')) -%} --c

-- select every field, dynamically applying a rename to ensure there are no conflicts
select
 *
from
  {{source('staging', 'rookie_season_totals')}} as common_rookie
inner join
  {{source('staging', 'player_per_game_totals')}} as common_player

using (Player)