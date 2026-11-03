FROM iamdevopstrainer/tomcat:base
RUN rm -rf /usr/local/tomcat/webapps/ROOT \
           /usr/local/tomcat/webapps/ROOT.war
COPY addressbook.war /usr/local/tomcat/webapps/ROOT.war
ENTRYPOINT ["catalina.sh", "run"]
