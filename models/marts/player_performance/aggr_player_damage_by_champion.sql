with 

source as (

    select * from {{ ref('int_player_stats') }}

),

renamed as (

    select
        id_player,
        id_champion,
        avg(level) as average_level,
        sum(kills) as total_kills,
        sum(deaths) as total_deaths,
        sum(assists) as total_assists,
        count(*) as times_played,
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
        id_player, id_champion
        
),
by_champion as (
    select
        d.id_champion,
        d.champion,
        r.id_player,
        dp.player_name,        
        r.times_played,
        average_level,
        total_kills,
        total_deaths,
        total_assists,
        average_kda,
        total_damage_to_champion,
        total_phisical_damage,
        total_magic_damage,
        total_true_damage,
        average_damage_per_minute,
        total_damage_dealt_to_turrets,
        total_damage_taken

    from renamed r
    JOIN {{ref('dim_champion')}} d
    ON r.id_champion = d.id_champion
    JOIN {{ref('dim_player')}} dp
    ON r.id_player = dp.id_player

    order by player_name
)


select * from by_champion
