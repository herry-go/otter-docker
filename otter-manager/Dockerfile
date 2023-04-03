FROM hub.deepin.com/public/oracle-jdk:8

ENV OTTER_VERSION=4.2.18
ENV OTTER_HOME /otter-manager

ENV Xms 2048m
ENV Xmx 3072m
ENV Xmn 1024m
ENV PermSize 96m
ENV MaxPermSize 256m
ENV appName otter-manager


RUN apt-get update
RUN apt-get install wget -y
#添加启动脚本
COPY docker-entrypoint.sh /usr/local/bin/
COPY start.sh ${OTTER_HOME}/bin/

RUN \
    mkdir -p /otter-manager && \
    cd $OTTER_HOME && \
    wget https://github.com/alibaba/otter/releases/download/otter-${OTTER_VERSION}/manager.deployer-${OTTER_VERSION}.tar.gz && \
    tar -zxvf manager.deployer-${OTTER_VERSION}.tar.gz && \
    rm -rf manager.deployer-${OTTER_VERSION}.tar.gz && \
    chmod a+x ${OTTER_HOME}/bin/start.sh && \
    chmod a+x /usr/local/bin/docker-entrypoint.sh && \
    true


EXPOSE 1099 8082
VOLUME [ "/otter-manager/logs", "/otter-manager/conf" ]
# 配置容器启动后执行的命令
ENTRYPOINT ["docker-entrypoint.sh"]
# 执行最终命令，启动 otter-manager
CMD ["start"]