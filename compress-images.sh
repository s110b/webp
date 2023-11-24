#!/bin/bash


ORIGIN_DIR="/images/origin"
COMPRESSED_DIR="/images/compressed"


mkdir -p /images/compressed

ls -al /images/origin





find "$ORIGIN_DIR" -type f \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' \) -print0 | xargs -0 -P 4 -I {} echo "Processing {}" && squoosh-cli --webp '{}' --output-dir "$COMPRESSED_DIR"