with
    source as (select * from {{ ref("base_matchstats__matchstats") }}),

    games_won as (
        select 
            id_serie, 
            id_team, 
            count(*) as games_won
        from source
        where outcome = 'Win'
        group by id_serie, id_team
    ),

    match_winner as (
        select 
            id_serie, 
            id_team as id_team_winner, 
            games_won
        from
            (
                select
                    id_serie,
                    id_team,
                    games_won,
                    row_number() over (
                        partition by id_serie order by games_won desc
                    ) as rn
                from games_won
            )
        where rn = 1
    )

select

    min(s.serie_key) as serie_key,
    s.id_serie,
    mw.id_team_winner,
    min(s.round) as round,
    min(s.day_of_match) as day_of_match,
    min(s.patch) as patch,
    min(s.stage) as stage,
    min(s.total_games_match) as total_games_match,
    min(s.match_format) as match_format,
    min(s.date) as date
from source s
left join match_winner mw on s.id_serie = mw.id_serie
group by s.id_serie, mw.id_team_winner
