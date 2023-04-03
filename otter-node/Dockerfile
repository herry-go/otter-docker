FROM hub.deepin.com/public/oracle-jdk:8

ENV OTTER_VERSION=4.2.18
ENV OTTER_HOME /otter-node

ENV Xms 2048m
ENV Xmx 3072m
ENV Xmn 1024m
ENV PermSize 96m
ENV MaxPermSize 254m
ENV appName otter-node


RUN apt-get update
RUN apt-get install wget -y

#添加启动脚本
COPY docker-entrypoint.sh /usr/local/bin/
COPY start.sh ${OTTER_HOME}/bin/
COPY aria2c /usr/local/bin/

RUN \
    cd /tmp && \
    mkdir -p /otter-node && \
    cd $OTTER_HOME && \
    wget https://github.com/alibaba/otter/releases/download/otter-${OTTER_VERSION}/node.deployer-${OTTER_VERSION}.tar.gz && \
    tar -zxvf node.deployer-${OTTER_VERSION}.tar.gz && \
    rm -rf node.deployer-${OTTER_VERSION}.tar.gz && \
    chmod a+x /usr/local/bin/aria2c && \
    chmod a+x ${OTTER_HOME}/bin/start.sh && \
    chmod a+x /usr/local/bin/docker-entrypoint.sh && \
    true

EXPOSE 2088 2090 9092
VOLUME [ "/otter-node/logs", "/otter-node/conf","/otter-node/download" ,"/otter-node/extend" ,"/otter-node/htdocs"  ]
# 配置容器启动后执行的命令
ENTRYPOINT ["docker-entrypoint.sh"]
# 执行最终命令，启动 otter-manager
CMD ["start"]
