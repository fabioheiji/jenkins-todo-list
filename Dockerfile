FROM python:3.9.18-alpine3.18
# FROM python:3.9-slim-buster
# FROM python:3.10.13-slim-bullseye

RUN echo "entrou no Dockerfile"

ENV PYTHONUNBUFFERED 1

# RUN mkdir -p /usr/src/

# RUN apt-get update && apt-get upgrade -y
# RUN apt-get install default-libmysqlclient-dev -y
# RUN apt-get install gcc -y
# RUN apt-get install build-essential python3-dev -y

# Update and upgrade packages
RUN apk update && apk upgrade

# Install dependencies for mysqlclient and other python packages
# default-libmysqlclient-dev \
# RUN apk add --no-cache --virtual .build-deps \
#     mariadb-dev \
#     gcc \
#     python3-dev \
#     musl-dev 
# RUN apk update \
#     && apk add --virtual build-deps gcc python3-dev musl-dev linux-headers \
#     && apk add --no-cache mariadb-dev    
RUN set -e; \
        apk add --no-cache --virtual .build-deps \
                gcc \
                libc-dev \
                linux-headers \
                mariadb-dev \
                python3-dev \
                postgresql-dev \
                freetype-dev \
                libpng-dev \
                g++;

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

WORKDIR /usr/src/

COPY . /usr/src/jenkins-todo-list

WORKDIR /usr/src/jenkins-todo-list

RUN sed -i 's/\r$//' ./entrypoint.sh


RUN chmod +x ./entrypoint.sh

EXPOSE 8000

# CMD "python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py runserver 0:8000"
# CMD ["sh", "-c", "python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py runserver 0:8000"]
# ENTRYPOINT ["/usr/src/jenkins-todo-list/filename.sh"]
# CMD ["sh", "-c", "./entrypoint.sh"]
# CMD ["sh", "-c", "./entrypoint.sh"]
RUN ./entrypoint.sh
# CMD entrypoint.sh