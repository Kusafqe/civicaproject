with 

source as (

    select distinct * 
    from {{ ref('stg__player') }}

),

renamed as (

    select
        id_role
        role,
        
        

    from source

)

select * from renamed
