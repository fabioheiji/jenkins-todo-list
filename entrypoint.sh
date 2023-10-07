#!/bin/sh

set -e

echo "running testes."
# python3 check_db.py --service-name mysql --ip db --port 3306
python3 check_db.py --service-name mysql --ip ${IP_MYSQL} --port 3306

echo "running makemigrations."
# python3 manage.py makemigrations --merge
python3 manage.py makemigrations
echo "running migrate."
# python3 manage.py migrate --noinput
python3 manage.py migrate

# echo "${0}: collecting statics."

echo "upload server."
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
function Error()
{
    echo "Error occur at line $1"
}
Trap 'Error $LINENOE" ERR