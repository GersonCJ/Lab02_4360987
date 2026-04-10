from constants import path_strings
from data_quality import gx
from dotenv import load_dotenv
from pathlib import Path
from sqlalchemy import create_engine
import os
import src.extraction as ext
# import src.load as ld
# import src.transformation as trf
import urllib.parse

load_dotenv()

def main():

    # Path and requirements

    url = path_strings.url_main
    url_metadata = path_strings.metadata_url
    bronze_path = Path(path_strings.bronze_path)
    mounted_gx_location = path_strings.gx_location

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


if __name__ == "__main__":
    main()