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
        round,
        --day_of_match, no es interesante 
        patch,
        stage,
        total_games_match,
        match_format,
        date
        
    from source
    
)

select * from renamed
