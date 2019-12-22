FROM ruby:2.7.0-alpine3.11
ENV LANG C.UTF-8
ENV APP_ROOT /myapp
ENV DEBCONF_NOWARNINGS yes
ENV RUNTIME_PACKAGES="linux-headers libxml2-dev make gcc libc-dev nodejs tzdata g++ postgresql-dev postgresql"
ENV BUILD_PACKAGES="build-base curl-dev"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-packages --no-cache ${BUILD_PACKAGES} && \
    rm -rf /usr/local/bundle/cache/* /usr/local/share/.cache/* /var/cache/* /tmp/*

RUN gem install -v 6.0.2.1 rails && \
    gem install -v 1.10.7 nokogiri && \
    gem install bundler

WORKDIR /tmp
COPY Gemfile* /tmp/

RUN bundle config set clean 'true' && \
    bundle install && \
    apk del build-packages libxml2-dev curl-dev make gcc libc-dev g++

WORKDIR ${APP_ROOT}
ADD . ${APP_ROOT}/

CMD ["rails", "server", "-b", "0.0.0.0"]
