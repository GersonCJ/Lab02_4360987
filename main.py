from constants import path_strings
from data_quality import gx
from dotenv import load_dotenv
from pathlib import Path
from sqlalchemy import create_engine
import os
import src.extraction as ext
import src.load as ld
# import src.transformation as trf
import urllib.parse

load_dotenv()

def main():

    # Path and requirements

    url = path_strings.url_main
    url_metadata = path_strings.metadata_url
    bronze_path = Path(path_strings.bronze_path)
    mounted_gx_location = path_strings.gx_location
    raw_main_path = Path(path_strings.raw_main_path)

    # ------------------ Extraction using commit a499dd34c1372468f2335a370c5dd13cc3a72d90

    if not any(bronze_path.iterdir()):
        print("Starting extraction ...")
        ext.extract(url, url_metadata)
    else:
        print("Data already available. Skipping extraction ...")

    # Validation Layer on raw data
    if not any(mounted_gx_location.iterdir()):
        gx.run_validation()
    else:
        print("Validation already performed. Verify the results html results.")

    # ------------------- Load to Postgres (Before transformation)

    raw_parquet = ld.load_silver(raw_main_path)  # Load .parquet raw dataframe

    # 2. Get .env endpoints

    user = os.getenv("DB_USER")
    password = os.getenv("DB_PASSWORD")
    host = os.getenv("DB_HOST")
    port = os.getenv("DB_PORT")
    db_name = os.getenv("DB_NAME")

    # 3. Encode the password to handle special characters (@, !, #, etc...)
    encoded_password = urllib.parse.quote_plus(password)

    # 4. Create the engine to connect to Postgres Database

    engine = create_engine(f"postgresql://{user}:{encoded_password}@{host}:{port}/{db_name}")

    # 5. Push raw directly to Postgres
    ld.push_to_db(raw_parquet, "raw_full", engine, schema="staging_raw")


if __name__ == "__main__":
    main()