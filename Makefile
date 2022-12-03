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
	docker-compose exec web python manage.py makemigrations

docker-db-migrate:
	docker-compose exec web python manage.py migrate

docker-createsuperuser:
	docker-compose exec web python manage.py createsuperuser --noinput

docker-test:
	make docker-poetry-install
	docker-compose run --rm web python manage.py migrate --settings=config.settings.test
	docker-compose run --rm web coverage run --source='.' manage.py test --settings=config.settings.test
	docker-compose run --rm web coverage report

docker-lint:
	make docker-poetry-install
	docker-compose run --rm web flake8 apiv1 config manage.py
	docker-compose run --rm web isort --profile black --check --diff apiv1 config manage.py
	docker-compose run --rm web black --check apiv1 config manage.py
	docker-compose run --rm web mypy apiv1 config manage.py

docker-format:
	make docker-poetry-install
	docker-compose run --rm web isort --profile black apiv1 config manage.py
	docker-compose run --rm web black apiv1 config manage.py

docker-check-deploy:
	docker-compose run --rm web python manage.py check --deploy --settings=config.settings.production

docker-generateschema:
	make docker-poetry-install
	docker-compose run --rm web python manage.py generateschema > docs/openapi-schema.yml

docker-graph-models:
	make docker-poetry-install
	docker-compose run --rm web python manage.py graph_models -a -o docs/erd.png

docker-show-urls:
	make docker-poetry-install
	docker-compose run --rm web python manage.py show_urls

docker-django-shell:
	docker-compose exec web python manage.py shell