with 

source as (

    select id_role, role from 
    {{ ref('stg__player') }}

),

renamed as (

    select distinct
        id_role,
        role

    from source

)

select * from renamed
