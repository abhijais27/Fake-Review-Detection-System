"""
WSGI config for fake_product_review_detection_sentiment_analysis project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "fake_product_review_detection_sentiment_analysis.settings")

application = get_wsgi_application()
