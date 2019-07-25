FROM ruby:2.6.3-stretch

RUN apt-get update && apt-get install -y build-essential

RUN mkdir /app
WORKDIR /app
COPY Gemfile .
RUN gem install bundler
RUN bundle install
RUN bundle update --bundler
COPY Gemfile.lock .


COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]