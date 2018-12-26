#!/bin/env bash

set -e

TMP_DIR=$(mktemp -d)

for file in tabs/*.tex; do
  FILE_NAME=$(basename -- "$file")
  EXTENSION="${filename##*.}"
  FILE_NAME="${filename%.*}"

  echo ">> $FILE_NAME"

  pdflatex \
    --output-directory "$TMP_DIR" \
    "$file"

done

pdfjoin -o partitions.pdf "$TMP_DIR"/*.pdf
