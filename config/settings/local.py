import os
from typing import Dict, Union

from .base import (
    AUTH_PASSWORD_VALIDATORS,
    BASE_DIR,
    DEFAULT_AUTO_FIELD,
    INSTALLED_APPS,
    LANGUAGE_CODE,
    MIDDLEWARE,
    ROOT_URLCONF,
    SECRET_KEY,
    TEMPLATES,
    TIME_ZONE,
    USE_I18N,
    USE_L10N,
    USE_TZ,
    WSGI_APPLICATION,
)

__all__ = [
    "BASE_DIR",
    "SECRET_KEY",
    "MIDDLEWARE",
    "ROOT_URLCONF",
    "TEMPLATES",
    "WSGI_APPLICATION",
    "DATABASES",
    "AUTH_PASSWORD_VALIDATORS",
    "LANGUAGE_CODE",
    "TIME_ZONE",
    "USE_I18N",
    "USE_L10N",
    "USE_TZ",
    "DEFAULT_AUTO_FIELD",
]


DEBUG = True

ALLOWED_HOSTS = ["*"]


INSTALLED_APPS += ["django_extensions", "silk"]

DEFAULTS = {
    "DEFAULT_RENDERER_CLASSES": [
        "rest_framework.renderers.JSONRenderer",
        "rest_framework.renderers.BrowsableAPIRenderer",
    ]
}

MIDDLEWARE += ("silk.middleware.SilkyMiddleware",)

DATABASES: Dict[str, Dict[str, Union[str, Dict[str, str]]]] = {
    "default": {
        "ENGINE": os.getenv("DATABASE_ENGINE", "django.db.backends.mysql"),
        "NAME": os.getenv("DATABASE_NAME", "django-db"),
        "USER": os.getenv("DATABASE_USER", "django"),
        "PASSWORD": os.getenv("DATABASE_PASSWORD", "django"),
        "HOST": os.getenv("DATABASE_SERVICE_HOST", "db"),
        "PORT": os.getenv("DATABASE_SERVICE_PORT", "3306"),
    }
}
