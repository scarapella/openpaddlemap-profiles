#!/bin/bash
set -e
cd "$(dirname "$0")"

SOURCE_DIR="./profiles2/"
# Check if an argument is provided
if [ ! -z "$1" ]; then
    SOURCE_DIR="$1"
fi
PROJECT="paddle-map"
DEST_BUCKET="gs://na-ne2-paddlemap-profiles"
DEST_DIR="/profiles2"
DEST_LOCATION="$DEST_BUCKET$DEST_DIR"

echo "source: \"$SOURCE_DIR\""
echo "dest  : \"$DEST_LOCATION\""
echo ""

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory $SOURCE_DIR not found."
    exit 1
fi

gcloud storage cp -r $SOURCE_DIR $DEST_LOCATION/ --project="$PROJECT" 
echo "Profiles published successfully to $DEST_LOCATION" 