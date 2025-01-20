# 构建阶段
FROM registry.cn-chengdu.aliyuncs.com/hibegin/ubuntu:noble AS deps
MAINTAINER "xiaochun" 90xchun@gmail.com
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
ARG DUMMY
RUN mkdir -p /opt/zrlog
RUN /usr/bin/curl -o /opt/zrlog/zrlog.zip https://dl.zrlog.com/preview/zrlog-Linux-x86_64.zip?${DUMMY}
RUN cd  /opt/zrlog && unzip zrlog.zip
ADD /bin/run.sh /run.sh
RUN chmod a+x /run.sh
RUN rm /opt/zrlog/zrlog.zip

CMD /run.sh


