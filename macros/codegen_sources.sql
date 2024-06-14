{{
    codegen.generate_source(
        schema_name = 'load',
        database_name = 'ALUMNO3_DEV_BRONZE_DB',
        table_names = ['matchStats' ],
        generate_columns = True,
        include_descriptions=True,
        include_data_types=True,
        name='matchStats',
        include_database=True,
        include_schema=True
        )
}}