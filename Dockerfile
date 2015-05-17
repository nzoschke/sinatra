FROM convox/ruby

WORKDIR /app

# cache bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# copy the rest of the app
COPY . /app
