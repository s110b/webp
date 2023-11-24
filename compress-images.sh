#!/bin/bash

ORIGIN_DIR="/images/origin"
COMPRESSED_DIR="/images/compressed"

# 创建压缩后的目录
mkdir -p "$COMPRESSED_DIR"

# 处理图片
for ext in jpg JPG jpeg JPEG png PNG; do
  for file in "$ORIGIN_DIR"/*.$ext; do
    if [ -f "$file" ]; then
      squoosh-cli --webp "$file" --output-dir "$COMPRESSED_DIR" &
      if (( $(jobs -r | wc -l) >= 4 )); then
        wait -n
      fi
    fi
  done
done

wait
