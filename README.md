# Summary
This will be a website allowing users to keep track of beads they own, as well as specifications of those beads and an easy way to sort through them.

# Deployment
Deployment requires Docker and Docker Compose, which can be found [here](https://www.docker.com/products/docker-desktop). Docker Compose comes with Docker Desktop.

To deploy the project:

```
docker-compose up -d
```

The `-d` flag signals the container to run in the background, so commands can still be run on the terminal.

Also, the _first_ time the project is deployed, a database must be created:

```
docker-compose run web rake db:create
```

The website will be hosted at [http://localhost:3900](http://localhost:3900).

To stop the container:
```
docker-compose down
```

If you wish to run commands within the container (like Rails commands):

```
docker exec -it <container name> /bin/bash
```
This starts a bash terminal within the container. The bash terminal can be exited back to the host terminal with the command `exit`. To find the container name:
```
docker ps
```
This will list all running containers. The container name will likely be `bead-listing_web_1`.
