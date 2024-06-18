with 

source as (

    select id_player, player_name, id_role, id_team, date_load from 
    {{ ref('stg__player') }}

),

renamed as (

    select
        id_player,
        player_name,
        id_role,
        id_team,
        date_load

    from source

)

select * from renamed
