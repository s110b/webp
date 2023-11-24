#!/bin/bash


ORIGIN_DIR="/images/origin"
COMPRESSED_DIR="/images/compressed"


mkdir -p /images/compressed

ls -al /images/origin





find "$ORIGIN_DIR" -type f \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' \) -exec sh -c 'echo "Processing file: $1"; squoosh-cli --webp "$1" --output-dir "$2"' _ {} "$COMPRESSED_DIR" \;