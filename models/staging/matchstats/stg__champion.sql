with 

source as (

    select distinct id_champion, champion
    from {{ ref('base_matchstats__matchstats') }}
),

renamed as (

    select
        id_champion,
        champion     
    from source

)

select * from renamed
