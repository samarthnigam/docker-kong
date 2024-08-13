#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER"  <<-EOSQL
	CREATE USER keycloak WITH SUPERUSER PASSWORD 'keycloak';
	CREATE DATABASE keycloak;
	GRANT ALL PRIVILEGES ON DATABASE keycloak TO keycloak;
	GRANT ALL ON SCHEMA public TO keycloak;
EOSQL
