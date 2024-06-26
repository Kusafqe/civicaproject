{{
    config(
        materialized='incremental',
        unique_key='id_ban',
        on_schema_change='fail'
    )
}}


with 

source as (

    select * from {{ ref('stg__ban') }}

),

renamed as (

    select
        id_ban,
        id_game,
        id_team,        
        ban,
        date_load
        

    from source

)

select * from renamed


{% if is_incremental() %}

  where date_load > (select max(date_load) from {{ this }})

{% endif %}