with 

source as (

    select 
        *
    from {{ ref('stg__match') }}

),

renamed as (

    select
        serie_key,
        id_serie,
        id_team_winner,
        round,
        patch,
        stage,
        total_games_match,
        match_format,
        date
        
    from source
    
)

select * from renamed
