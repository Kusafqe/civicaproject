with 

source as (

    select distinct id_team, team_name from {{ ref('stg__team') }}

),

renamed as (

    select
        id_team,
        team_name,
        
    from source

)

select * from renamed

