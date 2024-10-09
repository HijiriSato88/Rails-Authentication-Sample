FROM ruby:3.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-mysql-client

RUN mkdir /app-demo
WORKDIR /app-demo

ADD Gemfile /app-demo/Gemfile
ADD Gemfile.lock /app-demo/Gemfile.lock

RUN bundle install

ADD . /app-demo