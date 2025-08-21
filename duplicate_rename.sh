#!/bin/bash
# filepath: duplicate_rename.sh  ./myfile.txt

# Check if argument is given
if [ $# -eq 0 ]; then
  echo "File path not given"
  echo "Usage: $0 <file-path>"
  exit 1
fi

SRC_FILE="$1"

# Check if file exists
if [ ! -f "$SRC_FILE" ]; then
  echo "File '$SRC_FILE' does not exist."
  exit 1
fi

# Get filename and extension
FILENAME=$(basename -- "$SRC_FILE")
EXT="${FILENAME##*.}"
NAME="${FILENAME%.*}"

# Set Desktop path (Windows Git Bash or WSL)
DESKTOP="$HOME/Desktop"

# Copy file to Desktop
cp "$SRC_FILE" "$DESKTOP/$FILENAME"

# Create two duplicates with new names
cp "$DESKTOP/$FILENAME" "$DESKTOP/${NAME}_copy1.$EXT"
cp "$DESKTOP/$FILENAME" "$DESKTOP/${NAME}_copy2.$EXT"

# Delete original file from source folder
rm "$SRC_FILE"

echo "Done! Files created on Desktop:"
echo "$FILENAME"
echo "${NAME}_copy1.$EXT"
echo "${NAME}_copy2.$EXT"