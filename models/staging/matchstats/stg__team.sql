with 

source as (

    select distinct id_team, team_name from {{ ref('base_matchstats__matchstats') }}

),

renamed as (

    select
        id_team,
        team_name,
        
    from source

)

select * from renamed
