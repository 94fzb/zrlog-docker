FROM openjdk:21
MAINTAINER “xiaochun” xchun90@163.com
CMD [“/bin/bash”]
ARG DUMMY
RUN mkdir -p /opt/zrlog
RUN curl -o /opt/zrlog/zrlog.zip http://dl.zrlog.com/release/zrlog.zip?${DUMMY}
RUN cd  /opt/zrlog && jar -xf zrlog.zip
ADD /bin/run.sh /run.sh
RUN chmod a+x /run.sh
RUN rm /opt/zrlog/zrlog.zip

CMD /run.sh


