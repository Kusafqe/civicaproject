with 

source as (

    select * from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select distinct
        id_game_team_stats,
        id_game,
        id_team,
        outcome, 
        kills_team,
        turrets_team,
        dragon_team,
        baron_team, 
        side
    from source

)

select * from renamed
