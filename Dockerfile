FROM ruby:2.5.3 as base
ENV LANG C.UTF-8
ENV APP_ROOT=/app

RUN apt-get update -qq \
    &&  apt-get install -y --no-install-recommends \
        build-essential \
        nodejs \
        libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install
COPY . $APP_ROOT