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

docker-db-makemigrations:
		docker-compose exec web poetry run python manage.py makemigrations

docker-db-migrate:
	docker-compose exec web poetry run python manage.py migrate

docker-test:
	make docker-poetry-install
	docker-compose run --rm web poetry run python manage.py migrate --settings=config.settings.test
	docker-compose run --rm web poetry run coverage run --source='.' manage.py test --settings=config.settings.test
	docker-compose run --rm web poetry run coverage report

docker-lint:
	make docker-poetry-install
	docker-compose run --rm web poetry run flake8 apiv1 config manage.py
	docker-compose run --rm web poetry run isort --profile black --check --diff apiv1 config manage.py
	docker-compose run --rm web poetry run black --check apiv1 config manage.py
	docker-compose run --rm web poetry run mypy apiv1 config manage.py

docker-format:
	make docker-poetry-install
	docker-compose run --rm web poetry run isort --profile black apiv1 config manage.py
	docker-compose run --rm web poetry run black apiv1 config manage.py

docker-check-deploy:
	export DJANGO_SETTINGS_MODULE=config.settings.production
	docker-compose run --rm web poetry run python manage.py check --deploy

docker-generateschema:
	make docker-poetry-install
	docker-compose run --rm web poetry run python manage.py generateschema > openapi-schema.yml

docker-graph-models:
	make docker-poetry-install
	docker-compose run --rm web poetry run python manage.py graph_models -a -o erd.png

docker-show-urls:
	make docker-poetry-install
	docker-compose run --rm web poetry run python manage.py show_urls