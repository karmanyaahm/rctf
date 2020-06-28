#!/bin/sh

set -e


cp -n .env.example .env
cp -nR .rdeploy.example .rdeploy
cp -nR config/yml.example config/yml

mkdir -p data/rctf-postgres data/rctf-redis

chown -R 999 data
chmod 600 .env

docker-compose build
docker-compose run --rm rctf node install/docker-migrate.js
