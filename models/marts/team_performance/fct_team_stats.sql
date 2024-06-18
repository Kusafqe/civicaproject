{{
    config(
        materialized='incremental',
        unique_key='id_game_team_stats',
        on_schema_change='fail'
    )
}}


with 

source as (

    select * from {{ ref('stg__game_team_stats') }}

),

renamed as (

    select 
        id_game_team_stats,
        id_game,
        id_team,
        outcome,
        kills_team,
        turrets_team,
        dragon_team,
        baron_team, 
        side,
        date_load
    from source

)

select * from renamed


{% if is_incremental() %}

  where date_load > (select max(date_load) from {{ this }})

{% endif %}