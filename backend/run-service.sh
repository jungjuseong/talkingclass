DEVHOME=${HOME}/workspace/talkingclass

# kill processes

pkill -9 -f "java -jar"

# build common libs
echo "========> Build module-common libs"
cd ${DEVHOME}/backend/module-common
./gradlew clean jar

## user-service
echo "\n\n\n\n\n\n"
echo "=====> Launch user-service"
cd ${DEVHOME}/backend/user-service
 ./gradlew clean bootJar
java -jar build/libs/user-service-0.1.jar&
sleep 10

## portal-service
echo "\n\n\n\n\n\n"
echo "=========== Launch portal-service serveri =================="
cd ${DEVHOME}/backend/portal-service
./gradlew clean bootJar
java -jar build/libs/portal-service*.jar&
sleep 10

## board-service
echo "\n\n\n\n\n\n"
echo "============ Launch board-service server ================="
cd ${DEVHOME}/backend/board-service
./gradlew clean bootJar
java -jar build/libs/board-service-0.1.jar&

