# Sonar via Docker with Postgres

## Prerequisites
* Install docker-machine: ```brew install docker-machine```
* Create a docker machine (called mydocker): ```docker-machine create mydocker```
* Start that docker-machine: ```docker-machine start mydocker```
* Get the environment for that machine: ```eval $(docker-machine env mydocker)```
* IP address available at: ```docker-machine ip mydocker```
* Install docker-compose: ```brew install docker-compose```
* Clone this repo.

## Running
Run ```docker-compose up``` to start Sonar (with Postgres).  It will be running on port 9000 on your docker host's IP.  You can retrieve that via ```docker-machine ip <machine-name>```.

You will also need a local sonar-runner to invoke sonar on the server.

It will take a while to start up the first time.  It will also need to be configured with your local Sonar rules.
Access at http://<docker-ip>:9000


## Sonar Configuration
