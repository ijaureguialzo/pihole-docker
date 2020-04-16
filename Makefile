help:
	@echo 'Opciones:'
	@echo ''
	@echo 'start | stop | restart | stop-all'
	@echo 'workspace'
	@echo 'pull'
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

pull:
	@docker-compose pull

stats:
	@docker stats
