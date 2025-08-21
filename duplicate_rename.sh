#!/bin/bash

# Assignment 2: Duplicate & Rename
# Write a bash script that:
# Takes a file path as an argument (e.g., ./myscript.sh myfile.txt).
# Copies the file into the Desktop.
# Creates two duplicates of the file on the Desktop, renaming them as:
# myfile_copy1.txt
# myfile_copy2.txt
# Deletes the original file from the source folder.
# : Handle cases where the file doesn’t exist.


# filepath: duplicate_rename.sh  ./myfile.txt (It is the first argument)

# Check if argument is given
# $# mean no. of arguments while bashing 
if [ $# -eq 0 ]; then
  echo "File path not given"
  echo "Usage: $0 <file-path>"
  exit 1
fi

# $1 = first argument (the file path you provided).
# Stored in variable SRC_FILE.
SRC_FILE="$1"

# Check if file exists
if [ ! -f "$SRC_FILE" ]; then
  echo "File '$SRC_FILE' does not exist."
  exit 1
fi

# Get filename and extension
# removes from start , % removes from end
FILENAME=$(basename -- "$SRC_FILE")
EXTENSION="${FILENAME##*.}"    # extracting extension of file from last dot 
NAME="${FILENAME%.*}"

# Set Desktop path 
DESKTOP="$HOME/Desktop"

# Copy original file to Desktop
cp "$SRC_FILE" "$DESKTOP/$FILENAME"

# Create two duplicates with new names
cp "$DESKTOP/$FILENAME" "$DESKTOP/${NAME}_copy1.$EXTENSION"
cp "$DESKTOP/$FILENAME" "$DESKTOP/${NAME}_copy2.$EXTENSION"

# Delete original file from source folder
rm "$SRC_FILE"

echo "Done! Files created on Desktop:"
echo "$FILENAME"
echo "${NAME}_copy1.$EXTENSION"
echo "${NAME}_copy2.$EXTENSION"