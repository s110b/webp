#!/bin/bash


ORIGIN_DIR="/images/origin"
COMPRESSED_DIR="/images/compressed"


mkdir -p "$COMPRESSED_DIR"

ls -al $ORIGIN_DIR


find "$ORIGIN_DIR" -type f \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' \) -print0 | xargs -0 -P 4 -I {} squoosh-cli --webp '{}' --output-dir "$COMPRESSED_DIR"
