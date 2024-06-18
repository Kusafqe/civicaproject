with 

source as (

    select * from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select
        id_ban,
        id_game,
        id_team,        
        ban,
        date_load
        

    from source

)

select * from renamed
