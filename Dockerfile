FROM python:3.9-buster
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y build-essential graphviz-dev graphviz pkg-config

ENV DOCKERIZE_VERSION v0.6.1
RUN apt-get update && apt-get install -y wget \
  && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

WORKDIR /opt/app

RUN pip3 install poetry
COPY poetry.lock pyproject.toml ./
RUN poetry config virtualenvs.path ".venv"
RUN poetry config virtualenvs.in-project true
RUN poetry install --no-dev

ADD . /opt/app/