# 使用 fractalbitcoin/fractal:v0.1.6 镜像作为基础镜像
FROM fractalbitcoin/fractal:v0.1.6

# 设置数据目录
ENV BITCOIN_DATA /data

# 创建数据目录
RUN mkdir -p $BITCOIN_DATA

# 设置工作目录
WORKDIR $BITCOIN_DATA

# 暴露比特币节点的端口
EXPOSE 8330 8331 8332 8333

# 启动 bitcoind 并指定配置参数
ENTRYPOINT ["bitcoind", "-datadir=/data/", "-maxtipage=504576000"]

# 健康检查，用于监控节点状态
HEALTHCHECK CMD bitcoin-cli -datadir=/data/ getblockchaininfo || exit 1

# 将启动命令设置为空，使用默认的 entrypoint
CMD []
