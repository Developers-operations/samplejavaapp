# FROM tomcat:8.5.40
# COPY target/sampleapp.war /usr/local/tomcat/webapps
# EXPOSE 8080
# CMD /usr/local/tomcat/bin/catalina.sh run
#
# FROM openjdk:8-jre
# COPY target/sampleapp.war sampleapp.war
# # EXPOSE 8080
# # CMD /usr/local/tomcat/bin/catalina.sh run
# ENTRYPOINT [ "java","-jar","sampleapp.war"]
#----------------


FROM maven:openjdk-8 AS build
RUN mkdir /usr/src/project
COPY . /usr/src/project
WORKDIR /usr/src/project
RUN mvn clean install

FROM openjdk:8-jre-alpine
RUN mkdir /project
COPY --from=build /usr/src/project/target/sampleapp.jar /project/
WORKDIR /project
CMD java -jar sampleapp.jar
