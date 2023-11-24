#!/bin/bash

# 图片原始目录和压缩后目录
ORIGIN_DIR="/images/origin"
COMPRESSED_DIR="/images/compressed"

# 创建压缩后的目录
mkdir -p "$COMPRESSED_DIR"

ls -al $ORIGIN_DIR

# 压缩图片
find "$ORIGIN_DIR" -type f \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' \) -print0 | xargs -0 -P 4 -I {} squoosh-cli --webp '{}' --output-dir "$COMPRESSED_DIR"
