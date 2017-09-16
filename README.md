# Ruby

Ruby 2.3.1 + Postgres 9.6.5

[![Docker Build Status](https://img.shields.io/docker/build/sfoxdev/ruby.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/automated/sfoxdev/ruby.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/pulls/sfoxdev/ruby.svg?style=flat-square)]()
[![Docker Build Status](https://img.shields.io/docker/stars/sfoxdev/ruby.svg?style=flat-square)]()


## Usage

Start container
```
docker-compose up -d
```
Stop container
```
docker-compose down
```

## Make container with app from scratch

1. Create folder `app` and put here two files `Gemfile` and empty `Gemfile.lock`

2. Inial build
```
docker-compose up -d --build && docker-compose down
```
3. Create new app
```
docker-compose run --rm app rails new . --force --database=postgresql
```
4. Build container
```
docker-compose build
```
5. Edit `app/config/database.yml` file to setup your database
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: railsapp
  password: railsapp
  pool: 5

development:
  <<: *default
  database: myapp_development

test:
  <<: *default
  database: myapp_test
```
6. Run container
```
docker-compose up -d
```
7. Create DB
```
docker-compose run --rm app rake db:create
```
