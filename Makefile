#!make

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo start / stop / restart
	@echo ----------------------
	@echo build / update
	@echo workspace
	@echo logs / stats
	@echo clean
	@echo patch-dns-max-1232
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

patch-dns-max-1232:
	@docker compose exec pihole /bin/bash -c 'echo "edns-packet-max=1232" > /etc/dnsmasq.d/99-edns.conf'
