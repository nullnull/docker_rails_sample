# Setup for local development on docker
Please install [Docker](https://store.docker.com/search?type=edition&offering=community) on your local environment before setup.

```sh
$ git clone git@github.com:nullnull/docker_rails_sample.git
$ cd docker_rails_sample
$ docker-compose build
$ docker-compose run --rm rails bin/setup
$ docker-compose up
$ open http://localhost:3000
```

To shutdown server and remove containers

```sh
$ docker-compose down
```

To restart server

```sh
$ docker-compose up
```
