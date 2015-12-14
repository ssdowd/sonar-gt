# Sonar via Docker with Postgres

## Prerequisites
* Install docker-machine: ```brew install docker-machine```
* Create a docker machine (called mydocker): ```docker-machine create mydocker```
* Start that docker-machine: ```docker-machine start mydocker```
* Get the environment for that machine: ```eval $(docker-machine env mydocker)```
* IP address available at: ```docker-machine ip mydocker```
* Install docker-compose: ```brew install docker-compose```
* Clone this repo.

## Starting Sonar
Run ```docker-compose up -d``` to start Sonar (with Postgres).  It will be running on port 9000 on your docker host's IP.  You can retrieve that via ```docker-machine ip <machine-name>```.

You will also need a local sonar-runner to invoke sonar on the server.

It will take a while to start up the first time.  It will also need to be configured with your local Sonar rules.

Access [Sonar console here http://mydocker:9000](http://mydocker:9000)

Logs via ```docker-compose logs```


## Sonar Configuration
Load the Java configuration from the config directory using the Sonar console.

Add an entry to your hosts file for mydocker.

Go to [http://mydocker:9000](http://mydocker:9000), login as admin/admin.

Go to Settings, then Update Center.  Click Available Plugins.  Install:

* Javascript
* Web
* Cobertura
* Sonargraph


**Don't do Checkstyle and PMD.**

Restart Sonar:

```
docker-compose stop
docker-compose up -d
docker-compose logs
```

Reload the Sonar page in your browser.

Click Quality Profiles from the top menu, then click Restore Profile.  Load the profile configuration from the config directory in this project.  Repeat for all of them.

Click Quality Gates.  Copy the 'Sonar Way' to 'Roche Gate'. Delete all of the existing conditions and recreate as defined in Roche's Sonar (table below), then make it the default:

| Condition | Test | Predicate | Warn Value | Error Value |
|-----------|---|---|---|---|
| Blocker issues	| Value |	is greater than | | 0 |
| Complexity /class	| Value |is greater than| 10| 25|
|Coverage	|Value	|is less than|50|20|
|Critical issues|Value|is greater than|0|
|Duplicated lines (%)|Value|is greater than|5| 10|
|Overall coverage|Value|is less than	 |10|
 
## Sonar Project Run
Make sure your swaserver is running or you point the Spring profile at a testable environment.

```
mvn org.jacoco:jacoco-maven-plugin:prepare-agent \
clean install sonar:sonar \
-Dsonar.host.url=http://mydocker:9000 \
-Dsonar.jdbc.url=jdbc:postgresql://mydocker/sonar
```

Then go back to the Sonar console and view results.  You can also tie your Eclipse project to mydocker:9000 and analyze/sync from there, however the maven command above will work better.


