help:
	@echo 'Opciones:'
	@echo ''
	@echo 'start | stop | restart | stop-all'
	@echo 'workspace'
	@echo 'build'
	@echo 'stats'

start:
	@docker-compose up -d --remove-orphans

stop:
	@docker-compose stop

restart: stop start

stop-all:
	@docker stop `docker ps -aq`

workspace:
	@docker-compose exec pihole /bin/bash

build:
	@docker-compose build --pull

stats:
	@docker stats
