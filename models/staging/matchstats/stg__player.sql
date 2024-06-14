with 

source as (

    select distinct id_player, player_name, role, id_team from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select
        id_player,
        player_name,
        role,
        id_team,
        

    from source

)

select * from renamed
