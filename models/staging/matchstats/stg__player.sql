with 

source as (

    select distinct id_player, player_name, role, id_team from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select
        id_player,
        player_name,
        {{dbt_utils.generate_surrogate_key(['role'])}} as id_role,
        role,
        id_team,
        

    from source

)

select * from renamed