#!/bin/bash


ORIGIN_DIR="/images/origin"
COMPRESSED_DIR="/images/compressed"


mkdir -p /images/compressed




cd "$ORIGIN_DIR"/

squoosh-cli --webp auto ./ -d ../compressed



