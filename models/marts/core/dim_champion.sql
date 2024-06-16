with 

source as (

    select id_champion, champion
    from {{ ref('stg__champion') }}
),

renamed as (

    select
        id_champion,
        champion     
    from source

)

select * from renamed
