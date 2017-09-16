FROM ruby:2.3.1-slim
MAINTAINER SFoxDev <admin@sfoxdev.com>

ENV DEBIAN_FRONTEND="noninteractive" \
    LC_ALL="C.UTF-8" \
    LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8"

RUN apt-get update -qq ; apt-get install -y build-essential libpq-dev nodejs npm postgresql-client mc ; \
    mkdir /app ; \
    apt-get clean autoclean ; \
    apt-get autoremove --yes ; \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ;

WORKDIR /app

ADD app/Gemfile* /app/

RUN bundle install

ADD app/ /app

#RUN bundle exec rake RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname SECRET_TOKEN=pickasecuretoken assets:precompile

VOLUME ["/app"]

ENTRYPOINT ["bundle", "exec"]
CMD ["rails", "server", "-b", "0.0.0.0"]
