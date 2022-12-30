# FROM tomcat:8.5.40
# COPY target/sampleapp.war /usr/local/tomcat/webapps
# EXPOSE 8080
# CMD /usr/local/tomcat/bin/catalina.sh run
#
FROM openjdk:8-jre
COPY target/sampleapp.war sampleapp.war
# EXPOSE 8080
# CMD /usr/local/tomcat/bin/catalina.sh run
ENTRYPOINT [ "java","-jar","sampleapp.war"]
#----------------


