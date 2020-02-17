FROM ruby:2.7.0-alpine3.11
ENV LANG C.UTF-8
ENV APP_ROOT /myapp
ENV RUNTIME_PACKAGES="linux-headers build-base libxml2-dev libxslt-dev make gcc libc-dev nodejs yarn tzdata g++ postgresql-dev postgresql"
ENV DELETE_PACKAGES="build-packages libxml2-dev curl-dev make gcc libc-dev g++"
ENV BUILD_PACKAGES="build-base curl-dev"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache ${RUNTIME_PACKAGES} && \
    apk add --virtual build-packages --no-cache ${BUILD_PACKAGES} && \
    gem install rails -v '6.0.2.1' && \
    gem install bundler:2.1.4

WORKDIR /tmp
COPY Gemfile* /tmp/

RUN bundle install && \
    bundle clean --force && \
    apk del ${DELETE_PACKAGES} && \
    rm -rf /usr/local/share/.cache/* /var/cache/* /tmp/*

WORKDIR ${APP_ROOT}
ADD . ${APP_ROOT}/

CMD ["rails", "server", "-b", "0.0.0.0"]
