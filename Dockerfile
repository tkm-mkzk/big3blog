FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       vim

RUN mkdir /big3blog

WORKDIR /big3blog

ADD Gemfile /big3blog/Gemfile
ADD Gemfile.lock /big3blog/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /big3blog

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids
