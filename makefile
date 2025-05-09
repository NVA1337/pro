up:
	cd docker && docker-compose up -d --build
	cd docker && docker-compose exec ms_ex composer install --ignore-platform-req=ext-http
	cd docker && docker-compose exec ms_ex php bin/console doctrine:database:create --if-not-exists
	cd docker && docker-compose exec ms_ex php bin/console doctrine:migrations:migrate --no-interaction
up-stage:

	cd docker && docker-compose -f docker-compose.stage.yml up -d --build #--scale message_consumer_spf=3
	cd docker && docker-compose exec ms_ex composer install --ignore-platform-req=ext-http
	cd docker && docker-compose exec ms_ex php bin/console doctrine:database:create --if-not-exists
	cd docker && docker-compose exec ms_ex php bin/console doctrine:migrations:migrate --no-interaction

down-stage:
	cd docker && docker-compose -f docker-compose.stage.yml down