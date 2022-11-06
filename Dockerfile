FROM ruby:3.1.2
COPY . /application
WORKDIR /application
RUN bundle install
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y --force-yes nodejs
RUN node --version
RUN npm --version
EXPOSE 3000:3000
# todo: move to production deployment
CMD ["rails", "server", "-b", "0.0.0.0"]