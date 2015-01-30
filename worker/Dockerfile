FROM ruby:2.2.0

ENV GEM_HOME /var/lib/gem
ENV PATH /var/lib/gem/bin:$PATH
RUN gem install bundler

ENV RACK_ENV production
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

CMD ["bin/worker"]
