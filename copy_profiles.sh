#!/bin/bash
set -e
cd "$(dirname "$0")"

SOURCE_DIR="../brouter/misc/profiles2/"
# Check if an argument is provided
if [ ! -z "$1" ]; then
    SOURCE_DIR="$1"
fi

DEST_DIR="./profiles2"
FILES=("paddle.brf" "waterway.brf")

echo "source: \"$SOURCE_DIR\""
echo "dest  : \"$DEST_DIR\""
echo ""

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Directory $SOURCE_DIR not found."
    exit 1
fi
# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Copy files [5]
for file in "${FILES[@]}"; do
    if [ -f "$SOURCE_DIR/$file" ]; then
        cp "$SOURCE_DIR/$file" "$DEST_DIR/"
        echo "Copied: $file to $DEST_DIR/"
    else
        echo "Warning: $file not found in $SOURCE_DIR"
    fi
done