with 

source as (

    select * from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select
        
        {{dbt_utils.generate_surrogate_key(['ban'])}} as id_ban,
        ban,
        ban_opponent,
        {{dbt_utils.generate_surrogate_key(['pick'])}} as id_pick,
        pick,
        pick_opponent,
        champion,
        champion_opponent,
       
    from source

)

select * from renamed
