# 构建阶段
FROM registry.cn-chengdu.aliyuncs.com/hibegin/ubuntu:noble AS deps
MAINTAINER "zrlog" support@zrlog.com
# 替换 sources.list 中的所有 Ubuntu 镜像源为 Tsinghua University's mirror
RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|http://mirrors.tuna.tsinghua.edu.cn/ubuntu/|g; s|http://security.ubuntu.com/ubuntu/|http://mirrors.tuna.tsinghua.edu.cn/ubuntu/|g' /etc/apt/sources.list.d/ubuntu.sources
# 更新并安装所需工具
RUN apt update && apt install zip curl -y
# start build
FROM registry.cn-chengdu.aliyuncs.com/hibegin/ubuntu:noble
# 复制构建阶段的 zip 和 curl 工具
COPY --from=deps /usr/bin/zip /usr/bin/zip
COPY --from=deps /usr/bin/curl /usr/bin/curl
COPY --from=deps /usr/lib /usr/lib
COPY --from=deps /lib /lib
COPY --from=deps /lib64 /lib64
COPY --from=deps /bin /bin
COPY --from=deps /sbin /sbin
COPY --from=deps /usr/sbin /usr/sbin
COPY --from=deps /etc/ssl /etc/ssl
CMD ["/bin/bash"]
ARG TARGETARCH
RUN mkdir -p /opt/zrlog
RUN /usr/bin/curl -L -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"  -o /opt/zrlog/zrlog.zip https://pub-c16cba848aff4e6b8d8e0d00f0f741f0.r2.dev/preview/zrlog-Linux-${TARGETARCH}.zip?${DUMMY}
RUN cd  /opt/zrlog && unzip zrlog.zip
RUN chmod a+x /opt/zrlog/zrlog
RUN rm /opt/zrlog/zrlog.zip
WORKDIR /opt/zrlog/

ENV DOCKER_MODE=true
CMD ["./zrlog"]


