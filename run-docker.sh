docker stop $(docker ps -a -q --filter ancestor="egovframe/msa-edu-config:latest")
docker stop $(docker ps -a -q --filter ancestor="egovframe/msa-edu-discovery:latest")
docker stop $(docker ps -a -q --filter ancestor="egovframe/msa-edu-gateway:latest")
docker stop $(docker ps -a -q --filter ancestor="rabbitmq:management")
docker stop $(docker ps -a -q --filter ancestor="openzipkin/zipkin")
docker stop $(docker ps -a -q --filter ancestor="mysql:5.7")

docker-compose -f ./docker-compose/mysql/docker-compose.yml up -d
docker-compose -f ./docker-compose/app/mesh/docker-compose.yml up -d

#./backend/run-service.sh
