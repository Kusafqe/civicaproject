with 

source as (

    select * from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select distinct
        id_serie,
        id_game,        
        id_team,
        id_opponent_team,        
        date,
        round,
        day_of_match,
        patch,
        stage,
        game_number,
        total_games_match,
        match_format,
        game_of_day,        
        game_duration
        

    from source
    
)

select * from renamed
