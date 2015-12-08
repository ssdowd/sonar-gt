# Sonar via Docker with Postgres
Run ```docker-compose up``` to start Sonar (with Postgres).  It will be running on port 9000 on your docker host's IP.  You can retrieve that via ```docker-machine ip <machine-name>```.

You will also need a local sonar-runner to invoke sonar on the server.

It will take a while to start up.  It will also need to be configured with your local Sonar rules.

