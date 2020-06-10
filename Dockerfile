FROM openjdk:8-jre-alpine
ENV APP_FILE spring-web-0.0.1-SNAPSHOT.jar
ENV APP_HOME /usr/app
COPY target/$APP_FILE $APP_HOME/
WORKDIR $APP_HOME
USER 1001
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $APP_FILE"]