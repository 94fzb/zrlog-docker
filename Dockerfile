FROM adoptopenjdk/openjdk11
MAINTAINER “xiaochun” xchun90@163.com
CMD [“/bin/bash”]
RUN mkdir -p /opt/tomcat
RUN curl -o /opt/tomcat/ROOT.zip http://dl.zrlog.com/release/zrlog.zip?$(date +%Y%m%d%H%M%S)
RUN cd  /opt/tomcat && jar -xf ROOT.zip
#ADD db.properties /opt/tomcat/webapp/WEB-INF
#ADD install.lock /opt/tomcat/webapp/WEB-INF
ADD /bin/run.sh /run.sh
#RUN sh run.sh
RUN chmod a+x /run.sh
RUN rm /opt/tomcat/ROOT.zip

CMD /run.sh


