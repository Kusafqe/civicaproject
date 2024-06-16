with 

source as (

    select distinct
        date
    from {{ ref('stg__match') }}

),

renamed as (

    select
            date,
            year(date) AS year,
            month (date) AS month,
            day(date) AS day
        
    from source
    
)

select * from renamed
