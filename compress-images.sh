#!/bin/bash


ORIGIN_DIR="/images/origin"
COMPRESSED_DIR="/images/compressed"


mkdir -p /images/compressed

ls -al /images/origin





 

squoosh-cli --webp  "$ORIGIN_DIR"/  --output-dir "$COMPRESSED_DIR"
 
ls -al  "$COMPRESSED_DIR"

echo "Starting image compression process..."
# 处理图片
for file in "$ORIGIN_DIR"/*.{jpg,JPG,jpeg,JPEG,png,PNG}; do
  if [ -f "$file" ]; then
    echo "Compressing $file..."
    squoosh-cli --webp "$file" --output-dir "$COMPRESSED_DIR" &
    if (( $(jobs -r | wc -l) >= 4 )); then
      echo "Waiting for a job to finish..."
      wait -n
    fi
  else
    echo "No file found for $file"
  fi
done

echo "Waiting for all jobs to complete..."
wait
echo "Image compression process completed."