#!/bin/sh

set -e

echo "${0}: running makemigrations."
python3 check_db.py --service-name mysql --ip db --port 3306

echo "${0}: running makemigrations."
# python3 manage.py makemigrations --merge
python3 manage.py makemigrations
echo "${0}: running migrate."
# python3 manage.py migrate --noinput
python3 manage.py migrate

# echo "${0}: collecting statics."

echo "${0}: upload server."
python3 manage.py runserver 0:8000

# python manage.py collectstatic --noinput

# cp -rv static/* static_shared/

# gunicorn yourapp.wsgi:application \
#     --env DJANGO_SETTINGS_MODULE=yourapp.production_settings \
#     --name yourapp \
#     --bind 0.0.0.0:8000 \
#     --timeout 600 \
#     --workers 4 \
#     --log-level=info \
#     --reload