with 

source as (

    select * from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select
        id_game,
        --id_team,
        --id_ban,
        ban,

       
    from source
    union all 
    select
        id_game,
        --id_opponent_team,
        --id_opponent_ban, 
        ban_opponent
    from source

)

select * from renamed
