FROM openjdk:17
MAINTAINER “xiaochun” xchun90@163.com
CMD [“/bin/bash”]
ARG DUMMY
RUN mkdir -p /opt/tomcat
RUN curl -o /opt/tomcat/ROOT.zip http://dl.zrlog.com/release/zrlog.zip?${DUMMY}
RUN cd  /opt/tomcat && jar -xf ROOT.zip
ADD /bin/run.sh /run.sh
RUN chmod a+x /run.sh
RUN rm /opt/tomcat/ROOT.zip

CMD /run.sh


