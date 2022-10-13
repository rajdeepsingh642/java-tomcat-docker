FROM tomcat:9.0

ADD **/*.war /usr/share/tomcat9/webapps
EXPOSE 8081
CMD ["catalina.sh","run"]