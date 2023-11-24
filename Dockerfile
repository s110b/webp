# 使用一个带有 Node.js 的基础镜像
FROM node:latest

# 安装 squoosh-cli 用于图片压缩
RUN npm install -g @squoosh/cli

# 创建一个工作目录
WORKDIR /app

# 复制压缩脚本到容器中
COPY compress-images.sh /app/compress-images.sh

# 给脚本执行权限
RUN chmod +x /app/compress-images.sh

# 设置默认命令
CMD ["/app/compress-images.sh"]
