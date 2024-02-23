image=amagami:latest
container_name=amagami-api

build:
# docker build
	docker build -t $(image) .

run:
# create container and run background with volume
	docker run -it -d --name $(container_name) -v `pwd`/amagami-api:/usr/src/app -p 4000:4000 $(image)

start:
# start container
	docker start $(container_name)

stop:
# stop container
	docker stop $(container_name)

rm:
# remove container
	docker rm $(container_name)

bash:
# connect container
	docker exec -it $(container_name) /bin/bash

server:
# run server
	docker exec -it $(container_name) mix phx.server

create:
# create database
	docker exec -it $(container_name) mix deps.get
	docker exec -it $(container_name) mix ecto.create

migrate:
# migrate database
	docker exec -it $(container_name) mix ecto.migrate

sqlite:
# connect database
	docker exec -it $(container_name) sqlite3 ./data/amagami_dev.db

setup: build run start create migrate
# build image, run container, create database and migrate then seed
	docker exec -it $(container_name) mix run priv/repo/seeds.exs