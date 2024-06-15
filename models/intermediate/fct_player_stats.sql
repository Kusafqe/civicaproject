with 

source as (

    select * from {{ ref('stg__player_stats') }}

),

renamed as (

    select
        --id_player_stats,
        id_player,
        id_game,
        
        level,
        kills,
        deaths,
        assists,
        kda,
        cs,
        cs_in_team_s_jungle,
        cs_in_enemy_jungle,
        cs_per_minute,
        player_gold,
        gold_per_minute,
        gold_percent,
        vision_score,
        wards_placed,
        wards_destroyed,
        control_wards_purchased,
        detector_wards_placed,
        vision_score_per_minute,
        wards_placed_per_minute,
        vision_wards_placed_per_minute,
        control_wards_placed_per_minute,
        vision_score_percent,
        total_damage_to_champion,
        physical_damage,
        magic_damage,
        true_damage,
        damage_per_minute,
        damage_percent,
        kills_plus_assits_per_minute,
        kill_participation,
        solo_kills,
        double_kills,
        triple_kills,
        quadra_kills,
        penta_kills,
        gold_difference_at_15,
        cs_difference_at_15,
        xp_difference_at_15,
        level_difference_at_15,
        objectives_stolen,
        damage_dealt_to_turrets,
        damage_dealt_to_buildings,
        total_heal,
        total_heals_on_teammates,
        damage_self_mitigated,
        total_damage_shielded_on_teammates,
        time_ccing_others,
        total_time_cc_dealt,
        total_damage_taken,
        total_time_spent_dead,
        consumables_purchased,
        items_purchased,
        shutdown_bounty_collected,
        shutdown_bounty_lost,
        date_load
    from source

)

select * from renamed
