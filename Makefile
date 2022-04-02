help:
	@echo 'Opciones:'
	@echo ''
	@echo 'start | stop | restart | stop-all'
	@echo 'workspace'
	@echo 'build | update'
	@echo 'logs'
	@echo 'stats'
	@echo 'clean'
	@echo 'patch-dns-max-1232'

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

update: build start

logs:
	@docker-compose logs

stats:
	@docker stats

clean:
	@docker-compose down -v

patch-dns-max-1232:
	@docker-compose exec pihole /bin/bash -c 'echo "edns-packet-max=1232" > /etc/dnsmasq.d/99-edns.conf'
