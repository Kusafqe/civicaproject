with 

source as (

    select 
        *
    from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select
        min(serie_key) as serie_key,
        id_serie,
        min(round) as round,
        min(day_of_match) as day_of_match,
        min(patch) as patch,
        min(stage) as stage,
        min(total_games_match) as total_games_match,
        min(match_format) as match_format,
        min(date) as date
        
    from source
    group by id_serie
)

select * from renamed
