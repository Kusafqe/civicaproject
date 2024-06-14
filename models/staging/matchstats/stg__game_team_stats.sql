with 

source as (

    select * from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select
        id_game_team_stats,
        outcome, 
        kills_team,
        turrets_team,
        dragon_team,
        baron_team, 
        side
    from source

)

select * from renamed
