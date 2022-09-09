docker-build:
	docker-compose build

docker-poetry-update:
	docker-compose run --rm web poetry update

docker-poetry-install:
	docker-compose run --rm web poetry install

docker-up:
	docker-compose up

docker-up-build:
	docker-compose up --build

docker-down:
	docker-compose down

docker-db-migrate:
	docker-compose exec web poetry run python manage.py migrate

docker-test:
	make install
	docker-compose run --rm web poetry run python manage.py test

docker-lint:
	make install
	docker-compose run --rm web poetry run flake8 apiv1 config manage.py
	docker-compose run --rm web poetry run isort --check --diff apiv1 config manage.py
	docker-compose run --rm web poetry run black --check apiv1 config manage.py
	docker-compose run --rm web poetry run mypy apiv1 config manage.py

docker-format:
	make install
	docker-compose run --rm web poetry run isort apiv1 config manage.py
	docker-compose run --rm web poetry run black apiv1 config manage.py

docker-check-deploy:
	export DJANGO_SETTINGS_MODULE=config.settings.production
	docker-compose run --rm web poetry run python manage.py check --deploy

docker-generateschema:
	docker-compose run --rm web poetry run python manage.py generateschema > openapi-schema.yml
