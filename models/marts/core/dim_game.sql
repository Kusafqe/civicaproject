with 

source as (

    select * from {{ ref('stg__game') }}

),

renamed as (

    select distinct
        id_game,        
        id_team,        
        id_opponent_team,        
        date,                
        game_number,        
        game_of_day,        
        game_duration,
        outcome

    from source
    
)

select * from renamed
