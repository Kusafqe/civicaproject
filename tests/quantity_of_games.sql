SELECT * 
from {{ref('stg__game')}}
WHERE game_number > total_games_match