# Setting
## .env

create `.env`. Or hard cording, but it don't recommended.

## PostgreSQL setting.
**※ Please be sure to set.**

```
$ mkdir initdb; touch setup.sql
```

Rewrite your role and password, database to `initdb/setup.sql`.

## rails new

```
$ docker-compose run web rails new . --database=postgresql -B -M --skip-yarn --skip-test --skip-turbolinks
```

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
