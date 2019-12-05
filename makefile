configure:
	mkdir -p \
		htdocs/OMB100/data \
		htdocs/OMB100/public_html/internacional/data/ \
		htdocs/OMB100/cache/ 
	sudo chmod -R 777 \
		htdocs/OMB100/data \
		htdocs/OMB100/public_html/internacional/data/ \
		htdocs/OMB100/cache/

up: down
	docker-compose up -d

down:
	docker-compose down

build:
	docker-compose build --no-cache

propel:
	docker exec docker-office_php-fpm sh propel.sh

propel-create:
	docker exec docker-office_php-fpm sh propel-diff.sh
	sudo chown $($USER) $(stat -c "%Y:%n" OMB100/propel/omelhor_internacional/generated-migrations/* | sort -t: -n | tail -1 | cut -d: -f2-)

install:
	docker exec docker-office_php-fpm sh composer-install.sh
	# docker exec docker-office_php-fpm sh npm-install.sh

wait:
	echo wait
	sleep 10

front:
	cd ./htdocs/OMB100 && yarn install && yarn watch

auto: up wait propel install front
