#!/bin/bash

docker-machine start mydocker
eval $(docker-machine env mydocker)
docker-compose up -d
docker-compose logs
