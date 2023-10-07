#!/bin/sh

set -e

echo "running testes."

# python3 check_db.py --service-name mysql --ip db --port 3306
# python3 check_db.py --service-name mysql --ip $1 --port 3306

echo "running makemigrations."
# python3 manage.py makemigrations --merge
python3 manage.py makemigrations
echo "running migrate."
# python3 manage.py migrate --noinput
python3 manage.py migrate

# echo "${0}: collecting statics."

# python3 manage.py runserver 0:8000

echo "collecting static"
python manage.py collectstatic --noinput

echo "copying some files"
cp -rv static/* static_shared/

# echo "upload server."
# gunicorn to_do.wsgi:application --bind 0.0.0.0:8000 --workers 3 --daemon

# echo "server up"