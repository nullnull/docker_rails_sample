# Docker + Rails5.1 + Webpacker + postgresql + CircleCI + Heroku
[![CircleCI](https://circleci.com/gh/nullnull/docker_rails_sample.svg?style=svg)](https://circleci.com/gh/nullnull/docker_rails_sample)

An easy template with the minimun you need to start to work with Rails 5.1

## Setup for local development
Please install [Docker](https://store.docker.com/search?type=edition&offering=community) on your local environment before setup.

```sh
$ git clone git@github.com:nullnull/docker_rails_sample.git
$ cd docker_rails_sample
$ docker-compose build
$ docker-compose run --rm rails bin/setup
$ docker-compose up -d
$ open http://localhost:3000
```

To shutdown server and remove containers

```sh
$ docker-compose down
```

To restart server

```sh
$ docker-compose up -d
```

## Deploy to Heroku
see https://devcenter.heroku.com/articles/container-registry-and-runtime

```bash
# install plugin
heroku plugins:install heroku-container-registry

# login to container registryc
heroku container:login

# create new heroku app
heroku create

# deploy to heroku
heroku container:push web

# attach postgresql addon
heroku addons:create heroku-postgresql:hobby-dev

# db setup
heroku run rails db:migrate

# access to heroku and check /users
heroku open
```
