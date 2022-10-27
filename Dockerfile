FROM tomcat:9.0-jdk15

LABEL maintainer="nidhishnanavati@gmail.com"

ADD mypart2project.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
