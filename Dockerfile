# 构建阶段
FROM ubuntu:noble AS builder
MAINTAINER "xiaochun" xchun90@163.com
# 添加源列表文件
#RUN sed -i 's|http://archive.ubuntu.com/ubuntu/|https://mirrors.tuna.tsinghua.edu.cn/ubuntu/|g' /etc/apt/sources.list
# 更新并安装所需工具
RUN apt update && apt install zip curl -y
# start build
FROM ubuntu:noble
# 复制构建阶段的 zip 和 curl 工具
COPY --from=builder /usr/bin/zip /usr/bin/zip
COPY --from=builder /usr/bin/curl /usr/bin/curl
COPY --from=builder /usr/lib /usr/lib
COPY --from=builder /lib /lib
COPY --from=builder /lib64 /lib64
COPY --from=builder /bin /bin
COPY --from=builder /sbin /sbin
COPY --from=builder /usr/sbin /usr/sbin
COPY --from=builder /etc/ssl /etc/ssl
CMD ["/bin/bash"]
ARG DUMMY
RUN mkdir -p /opt/zrlog
RUN /usr/bin/curl -o /opt/zrlog/zrlog.zip https://dl.zrlog.com/preview/zrlog-Linux-x86_64.zip?${DUMMY}
RUN cd  /opt/zrlog && unzip zrlog.zip
ADD /bin/run.sh /run.sh
RUN chmod a+x /run.sh
RUN rm /opt/zrlog/zrlog.zip

CMD /run.sh


