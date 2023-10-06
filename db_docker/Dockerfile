# Use mysql as the base image
FROM mysql:8.1.0
# FROM mysql:8.0

# USER root
# Copy the SQL file to /docker-entrypoint-initdb.d
# COPY script.sql /docker-entrypoint-initdb.d/
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh \
    && ln -s /usr/local/bin/docker-entrypoint.sh /
# Set the environment variables for the mysql server
ENV MYSQL_ROOT_PASSWORD=mestre
ENV MYSQL_DATABASE=todo
ENV MYSQL_USER=devops
ENV MYSQL_PASSWORD=mestre
ENV MYSQL_HOST='127.0.0.1'
# Expose port 3306 for the mysql server

EXPOSE 3306

ENTRYPOINT ["docker-entrypoint.sh"]