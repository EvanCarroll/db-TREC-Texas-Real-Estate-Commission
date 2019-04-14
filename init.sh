#!/bin/sh
echo "TREC DOWNLOAD UTILITY"

## Set PG_HOST, PG_PORT, and PG_DATABASE for the load

DOWNLOAD_DIR=./download
UNZIP_DIR=./unzip
PROCESSED_DIR=./processed
URL_ROOT="https://www.trec.texas.gov/sites/default/files/high-value-data-sets/"
#SED_CMD="LC_CTYPE=C sed -e 's/[\x83\x00\xa8\xa4\xa1\xa5]//g'"

rm -rfv "$DOWNLOAD_DIR" "$UNZIP_DIR";
mkdir -v "$DOWNLOAD_DIR" "$PROCESSED_DIR" 2> /dev/null;

curl -o "$DOWNLOAD_DIR/county.txt" "$URL_ROOT/county.txt"

FILE="trecfile"
echo "Downloading $FILE"
curl -o "$DOWNLOAD_DIR/$FILE.zip" "$URL_ROOT/$FILE.zip" &&
  unzip -od $UNZIP_DIR "$DOWNLOAD_DIR/$FILE.zip" &&
  iconv -f CP850 -t UTF8 "$UNZIP_DIR/$FILE.txt" | sed -e 's/[\x00]//g' > "$PROCESSED_DIR/$FILE.txt";

FILE="erwfile"
echo "Downloading $FILE"
curl -o "$DOWNLOAD_DIR/$FILE.zip" "$URL_ROOT/$FILE.zip" &&
  unzip -od $UNZIP_DIR "$DOWNLOAD_DIR/$FILE.zip" &&
  iconv -f CP850 -t UTF8 "$UNZIP_DIR/$FILE.txt" | sed -e 's/[\x00]//g' > "$PROCESSED_DIR/$FILE.txt";

FILE="inspfile"
echo "Downloading $FILE"
curl -o "$DOWNLOAD_DIR/$FILE.zip" "$URL_ROOT/$FILE.zip" &&
  unzip -od $UNZIP_DIR "$DOWNLOAD_DIR/$FILE.zip" &&
  iconv -f CP850 -t UTF8 "$UNZIP_DIR/$FILE.txt" | sed -e 's/[\x00]//g' > "$PROCESSED_DIR/$FILE.txt";

psql -f runall.sql
