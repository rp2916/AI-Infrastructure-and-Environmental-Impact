import pandas as pd
from sqlalchemy import create_engine
import numpy as np

# ====================================================================
# PHASE 1: DATA INGESTION & CLEANING
# ====================================================================

def clean_and_process_data():
    print("Starting ETL Process...")

    # 1. Load Raw Data (Assuming files are in a 'raw_data' folder)
    # df_centers = pd.read_csv('raw_data/raw_data_centers.csv')
    # df_grids = pd.read_csv('raw_data/raw_regional_grids.csv')
    # df_hardware = pd.read_csv('raw_data/raw_hardware_metrics.csv')
    
    # NOTE: Since this is a portfolio script template, we will simulate the initial 
    # DataFrame creation to represent the raw data structure.
    
    # 2. Feature Engineering: Creating the 'Facility_Tier' categorization
    # In our project, we wanted to identify the massive 'Hyperscale' facilities
    def categorize_tier(mw):
        if pd.isna(mw):
            return 'Unknown'
        elif mw >= 150:
            return 'Hyperscale'
        elif mw >= 50:
            return 'Massive'
        elif mw >= 10:
            return 'Large'
        else:
            return 'Standard'

    # Example of applying the function (assuming df_centers is loaded)
    # df_centers['Facility_Tier'] = df_centers['Total_Facility_Power_MW'].apply(categorize_tier)

    # 3. Handling Missing/Dirty Data
    print("Cleaning missing values and formatting columns...")
    # Example cleaning steps:
    # df_grids['Renewable_Pct'].fillna(df_grids['Renewable_Pct'].median(), inplace=True)
    # df_centers['Primary_Cooling'].fillna('Air Cooled', inplace=True)
    
    # Strip whitespace from string columns to prevent SQL JOIN errors
    # for col in df_centers.select_dtypes(include=['object']).columns:
    #     df_centers[col] = df_centers[col].str.strip()

    # ====================================================================
    # PHASE 2: EXPORT TO FLAT FILES (For Tableau Public)
    # ====================================================================
    print("Exporting Cleaned CSVs for Tableau Public...")
    # df_centers.to_csv('cleaned_data/clean_data_centers.csv', index=False)
    # df_grids.to_csv('cleaned_data/clean_regional_grids.csv', index=False)
    # df_hardware.to_csv('cleaned_data/clean_hardware_metrics.csv', index=False)
    
    # ====================================================================
    # PHASE 3: DATABASE PIPELINE (PostgreSQL / DBeaver)
    # ====================================================================
    print("Connecting to PostgreSQL Database...")
    try:
        # SQLAlchemy connection string format: postgresql://username:password@host:port/database_name
        # Update credentials as needed for your local setup
        engine = create_engine('postgresql://postgres:Samu2916@localhost:5432/ai_infrastructure')
        
        # Push DataFrames directly into PostgreSQL tables
        # df_centers.to_sql('data_centers', engine, if_exists='replace', index=False)
        # df_grids.to_sql('regional_grids', engine, if_exists='replace', index=False)
        # df_hardware.to_sql('hardware_metrics', engine, if_exists='replace', index=False)
        
        print("Data successfully loaded into PostgreSQL!")
        
    except Exception as e:
        print(f"Database connection skipped or failed: {e}")
        print("Ensure PostgreSQL is running locally on port 5432.")

if __name__ == "__main__":
    clean_and_process_data()
