FROM java:openjdk-8u111-jre

MAINTAINER Chenna Vemula <chennarao.py@gmail.com>

EXPOSE 8080
EXPOSE 8090
ENV JAVA_VER=1.8.0

#RUN yum install -y wget \
#        yum install -y java-1.8.0-openjdk-headless \
#        yum clean all

RUN mkdir /projectname        

# Add jar file from jenkins workspace or from S3/Artifactory or from local target workspace
#ADD https://s3.amazonaws.com/s3-gpfs/target/spring-boot-web-0.0.1-SNAPSHOT.jar 

ADD target/spring-boot-web-0.0.1-SNAPSHOT.jar  /projectname

#add jar file from nexus artifactory

#ADD http://52.207.209.112:8081/repository/springboot/content/repositories/springboot/hosted/spring-boot-web-0.0.1-SNAPSHOT/Release/spring-boot-web-0.0.1-SNAPSHOT-Release.spring-boot-web-0.0.1-SNAPSHOT.jar  /projectname


WORKDIR /projectname

RUN chown -R 1001:1001 /projectname

USER 1001

#RUN bash -c "touch /projectname//projectname-1.0.jar"

#ENTRYPOINT exec java $JAVA_OPTS -jar /projectname//projectname-1.0.jar


CMD ["java","-jar","/spring-boot-web-0.0.1-SNAPSHOT.jar"]
#ENTRYPOINT ["java","-jar","/projectname/spring-boot-web-0.0.1-SNAPSHOT.jar"]


