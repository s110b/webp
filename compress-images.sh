#!/bin/bash


ORIGIN_DIR="/images/origin"
COMPRESSED_DIR="/images/compressed"


mkdir -p /images/compressed

ls -al /images/origin





 


 


echo "Starting image compression process..."
# 处理图片
for ext in "$ORIGIN_DIR"/*.{jpg,jpeg,png}; do
  for file in "$ORIGIN_DIR"/*.$ext; do
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
done

echo "Waiting for all jobs to complete..."
wait
echo "Image compression process completed."
