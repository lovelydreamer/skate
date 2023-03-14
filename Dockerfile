FROM ruby:3.1.2
COPY . /application
WORKDIR /application
RUN bundle install
# Todo: Bump this version - it's causing a 20s delay
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y --force-yes nodejs
RUN npm i -g yarn
RUN rails webpacker:install
EXPOSE 3000:3000

CMD ["bash", "-c", "script/setup_database.sh && rails server -b 0.0.0.0"]