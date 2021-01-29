#!/bin/sh

docker container rm -f auth-service
docker image rm -f pantha/auth-service:v1

./gradlew build 

cp ./build/libs/*.jar ./build/libs/app.jar
# java -jar ./build/libs/app.jar 

docker build --build-arg JAR_FILE=build/libs/app.jar -t pantha/auth-service:v1 .
#docker run  --name auth-service -d -p 50000:50000 pantha/auth-service:v1
