# docker build -t shoepping/h2o:20.03.02 ./
FROM openjdk:8-jre-slim

ENV H2O_VERSION 3.28.0.4

RUN apt-get update
RUN apt-get install -y wget unzip

RUN wget http://h2o-release.s3.amazonaws.com/h2o/rel-yu/4/h2o-${H2O_VERSION}.zip -P /opt

WORKDIR /opt
RUN unzip h2o-${H2O_VERSION}.zip
RUN ln -s h2o-${H2O_VERSION} h2o
CMD ["java", "-jar", "/opt/h2o/h2o.jar"]
