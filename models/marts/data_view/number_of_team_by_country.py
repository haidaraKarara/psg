import snowflake.snowpark.functions as F

def model(dbt, session):
    dbt.config(materialized = "table")
 
    df = (
        dbt.ref("referential_team")
        # .select("country")
        .groupBy("COUNTRY","COUNTRYID")
        .agg(
            F.count("COUNTRYID").alias("NBR_TEAMS")
        )
        .sort(F.col("nbr_teams").desc())
    )

    
    df = df.select("COUNTRY", "NBR_TEAMS")
    return df