{% snapshot dim_player_snapshot %}
{{
    config(
        unique_key='id_player',
        strategy='check',
        check_cols=['id_team'],

    )
}}

select * from {{ ref('dim_player') }}

{% endsnapshot %}
