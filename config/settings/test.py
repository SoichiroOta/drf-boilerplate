import os

from .base import (
    ALLOWED_HOSTS,
    APPEND_SLASH,
    AUTH_PASSWORD_VALIDATORS,
    AUTH_USER_MODEL,
    BASE_DIR,
    DEBUG,
    DEFAULT_AUTO_FIELD,
    INSTALLED_APPS,
    LANGUAGE_CODE,
    MIDDLEWARE,
    ROOT_URLCONF,
    SECRET_KEY,
    STATIC_ROOT,
    STATIC_URL,
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
    "DEBUG",
    "ALLOWED_HOSTS",
    "INSTALLED_APPS",
    "MIDDLEWARE",
    "ROOT_URLCONF",
    "TEMPLATES",
    "WSGI_APPLICATION",
    "AUTH_PASSWORD_VALIDATORS",
    "LANGUAGE_CODE",
    "TIME_ZONE",
    "USE_I18N",
    "USE_L10N",
    "USE_TZ",
    "DEFAULT_AUTO_FIELD",
    "STATIC_URL",
    "APPEND_SLASH",
    "STATIC_ROOT",
    "AUTH_USER_MODEL",
]


DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.sqlite3",
        "NAME": os.path.join(BASE_DIR, "db.sqlite3"),
    }
}
