FROM iamdevopstrainer/tomcat:base
COPY addressbook.war /usr/local/tomcat/webapps/ROOT.war
ENTRYPOINT ["catalina.sh", "run"]
