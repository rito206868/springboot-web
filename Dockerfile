# build
FROM maven
WORKDIR /usr/src/app
COPY . .
RUN mvn clean package install


#Application Image
FROM openjdk:8-jre-alpine
ENV APP_FILE spring-web-0.0.1-SNAPSHOT.jar
ENV APP_HOME /usr/app
WORKDIR $APP_HOME
COPY --from=0 /usr/src/app/target/$APP_FILE $APP_HOME/
EXPOSE 8080
USER 1001
ENTRYPOINT ["sh", "-c"]
CMD ["exec java -jar $APP_FILE"]