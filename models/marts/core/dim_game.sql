with 

source as (

    select * from {{ ref('stg__team_game') }}

),

renamed as (

    select 
        id_game,        
        min(id_team) as id_team,
        min(id_opponent_team) as id_opponent_team, 
        min(date) as date,
        min(round) as round,
        min(day_of_match) as day_of_match,
        min(patch) as patch,
        min(stage) as stage,
        min(game_number) as game_number,
        min(total_games_match) as total_games_match,
        min(match_format) as match_format,
        min(game_of_day) as game_of_day,
        min(game_duration) as game_duration,
        


    from source
    group by id_game        
)

select * from renamed

