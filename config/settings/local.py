from .base import (
    APPEND_SLASH,
    AUTH_PASSWORD_VALIDATORS,
    AUTH_USER_MODEL,
    BASE_DIR,
    DATABASES,
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
    "STATIC_URL",
    "APPEND_SLASH",
    "STATIC_ROOT",
    "AUTH_USER_MODEL",
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
