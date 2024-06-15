with 

source as (

    select * from {{ ref('fct_player_stats') }}

),

renamed as (

    select
        id_player,
        id_game,  
        avg(level) as average_level,
        sum(kills) as total_kills,
        sum(deaths) as total_deaths,
        sum(assists) as total_assists,
        avg(kda) as average_kda,
        sum(total_damage_to_champion) as total_damage_to_champion,
        sum(physical_damage) as total_phisical_damage,
        sum(magic_damage) as total_magic_damage,
        sum(true_damage) as total_true_damage,
        avg(damage_per_minute) as average_damage_per_minute,
        sum(damage_dealt_to_turrets) as total_damage_dealt_to_turrets,
        sum(total_damage_taken) as total_damage_taken

    from source
    group by 
        id_player,
        id_game

)

select * from renamed
