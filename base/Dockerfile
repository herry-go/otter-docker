# 使用debian作为基础镜像
FROM hub.deepin.com/library/debian:bullseye

# 切换到usr/local 目录下,没有则创建
WORKDIR /usr/local/jdk

# 将下载的jdk 的压缩包拷贝到镜像中，注意 ADD和COPY的区别，ADD 会解压，COPY不会解压
ADD jdk-8u321-linux-x64.tar.gz /usr/local/jdk

# 删除压缩包
RUN rm -rf /usr/local/jdk/jdk-8u321-linux-x64.tar.gz

# 设置JAVA_HOME 的环境变量
ENV JAVA_HOME /usr/local/jdk/jdk1.8.0_321

# 设置JAVA 环境
ENV CLASSPATH=$JAVA_HOME/bin:$JAVA_HOME/lib:$JAVA_HOME/jre/lib

# 将java可执行文件设置到PATH中，这样就可以使用java命令了
ENV PATH=.:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

# 容器启动后执行命令
CMD ["java","-version"]