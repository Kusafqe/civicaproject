with 

source as (

    select id_player, player_name, role, id_team from 
    {{ ref('stg__player') }}

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
