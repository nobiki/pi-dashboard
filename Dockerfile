FROM ruby:2.7-buster

ENV APP_ROOT /app
RUN mkdir /app
WORKDIR /app

RUN apt-get update \
 && apt-get install -y ruby-dev nodejs \
 && apt-get clean && apt-get autoclean \
 && rm -rf /var/lib/apt/lists/*

# smashing
RUN gem install --no-document smashing \
 && smashing new dashboard \
 && cd dashboard && bundle install

WORKDIR /app/dashboard

EXPOSE 3030
CMD ["smashing", "start", "-a", "0.0.0.0", "-p", "3030"]
