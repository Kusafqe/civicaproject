with 

source as (

    select * from {{ ref('int_player_stats') }}

),

renamed as (

    select        
        id_player,        
        id_champion,        
        avg(cs) as average_cs,
        avg(cs_per_minute) as average_cs_per_minute,
        avg(player_gold) as average_player_gold,
        avg(gold_per_minute) as average_gold_per_minute,        
        avg(gold_difference_at_15) as average_gold_difference_at_15,
        avg(cs_difference_at_15) as average_cs_difference_at_15,
        sum(shutdown_bounty_collected) as total_shutdown_bounty_colloected,
        min(date_load) as date_load
    from source
    group by id_player, id_champion

)

select * from renamed
