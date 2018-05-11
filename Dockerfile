FROM williamyeh/java8
MAINTAINER “xiaochun” xchun90@163.com
CMD [“/bin/bash”]
ARG DUMMY=unknown
RUN wget http://dl.zrlog.com/release/zrlog.zip?${DUMMY} -O zrlog.zip
RUN mkdir -p /opt/tomcat
RUN cp zrlog.zip /opt/tomcat/ROOT.zip
RUN cd  /opt/tomcat && jar -xf ROOT.zip
#ADD db.properties /opt/tomcat/webapp/WEB-INF
#ADD install.lock /opt/tomcat/webapp/WEB-INF
ADD /bin/run.sh /run.sh
#RUN sh run.sh
RUN chmod a+x /run.sh
RUN rm /zrlog.zip && rm /opt/tomcat/ROOT.zip

CMD /run.sh


