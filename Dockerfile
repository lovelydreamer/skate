FROM ruby:3.1.2
COPY . /application
WORKDIR /application
RUN bundle install
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y --force-yes nodejs
RUN npm i -g yarn
RUN rails webpacker:install
RUN rails db:create
RUN rails db:migrate
RUN rails db:seed
EXPOSE 3000:3000

CMD ["bash", "-c", "rails db:create ; rails db:migrate; rails db:seed; rails server -b 0.0.0.0"]