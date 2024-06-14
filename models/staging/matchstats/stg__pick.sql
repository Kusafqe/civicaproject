with 

source as (

    select * from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select        
        id_pick,
        pick,
        pick_opponent,
        champion,
        champion_opponent,
       
    from source

)

select * from renamed
