FROM ruby:3.1.2-slim

ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    APP_ROOT=/myapp

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    libpq-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR ${APP_ROOT}
COPY Gemfile* ${APP_ROOT}/

RUN gem install rails -v '7.0.2' && \
    gem install bundler

RUN bundle check || bundle install --jobs 4

ADD . ${APP_ROOT}/

EXPOSE 3000

CMD ["bundle", "exec", "foreman", "start", "-f", "Procfile"]
