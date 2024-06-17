with 

source as (

    select * from {{ ref('stg__ban') }}

),

renamed as (

    select
        id_ban,
        id_game,
        id_team,        
        ban
        

    from source

)

select * from renamed
