FROM postgres:12.2
ADD init.sql /docker-entrypoint-initdb.d/