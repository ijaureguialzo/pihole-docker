#!make

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo start / stop / restart
	@echo password
	@echo ----------------------
	@echo build / update
	@echo workspace
	@echo logs / stats
	@echo clean
	@echo ----------------------

_header:
	@echo -------
	@echo Pi-hole
	@echo -------

_urls: _header
	${info }
	@echo --------------------------------------
	@echo [Pi-hole] http://localhost:8080/admin/
	@echo --------------------------------------

_start-command:
	@docker compose up -d --remove-orphans

start: _start-command _urls

stop:
	@docker compose stop

restart: stop start

password:
	@docker compose exec pihole /bin/bash -c 'sudo pihole setpassword'

build:
	@docker compose build --pull

update: build start

workspace:
	@docker compose exec pihole /bin/bash

logs:
	@docker compose logs

stats:
	@docker stats

clean:
	@docker compose down -v
