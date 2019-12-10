# Application setting.
## docker-compose.yml setting.

Please set your environment for docker containers.

create `.env`. Or hard cording, but it don't recommended.

## PostgreSQL setting.
**※ Please be sure to set.**

```
$ mkdir initdb; touch setup.sql
```

Rewrite your role and password, database to `initdb/setup.sql`.

## config/database.yml

Please change your **development** and **test** database name.

## docker-compose build and bundle install, docker-compose up.

```
$ docker-compose build

$ docker-compose run web bundle install --path=vendor/bundle

$ docker-compose up
```

## db create and migrate

```
$ docker-compose run web rails db:create

$ docker-compose run web rails db:migrate
```
