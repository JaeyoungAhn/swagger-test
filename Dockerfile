FROM openjdk:17
ARG JAR_FILE=build/libs/app.jar
COPY ${JAR_FILE} ./app.jar
ENV TZ=Asia/Seoul
COPY application.yml /config/application.yml
ENV SPRING_CONFIG_NAME=application
ENV SPRING_CONFIG_LOCATION=file:/config/
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]