FROM ruby:2.6.3
ENV LANG C.UTF-8
ENV APP_ROOT /myapp
ENV DEBCONF_NOWARNINGS yes

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/* /tmp/* /var/tmp/*

# Linux authority setting
# COPY ./init/entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

RUN gem install rails bundler

WORKDIR /tmp

COPY Gemfile* /tmp/
RUN bundle install --clean --path=vendor/bundle \
    && mkdir ${APP_ROOT}

WORKDIR ${APP_ROOT}
ADD . ${APP_ROOT}/

CMD ["rails", "server", "-b", "0.0.0.0"]
