build:
	docker-compose build

update:
	docker-compose run --rm web poetry update

install:
	docker-compose run --rm web poetry install

up:
	docker-compose up

up-build:
	docker-compose up --build

down:
	docker-compose down

db-migrate:
	docker-compose exec web poetry run python manage.py migrate

test:
	make install
	docker-compose run --rm web poetry run python manage.py test

lint:
	make install
	docker-compose run --rm web poetry run flake8 apiv1 config manage.py
	docker-compose run --rm web poetry run isort --check --diff apiv1 config manage.py
	docker-compose run --rm web poetry run black --check apiv1 config manage.py
	docker-compose run --rm web poetry run mypy apiv1 config manage.py

format:
	make install
	docker-compose run --rm web poetry run isort apiv1 config manage.py
	docker-compose run --rm web poetry run black apiv1 config manage.py

check-deploy:
	export DJANGO_SETTINGS_MODULE=config.settings.production
	docker-compose run --rm web poetry run python manage.py check --deploy
