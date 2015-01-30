FROM ruby:2.2.0

ADD https://godist.herokuapp.com/projects/ddollar/init/releases/0.1.0/linux-amd64/init /usr/bin/init
RUN chmod +x /usr/bin/init

ENV GEM_HOME /var/lib/gem
ENV PATH /var/lib/gem/bin:$PATH
RUN gem install bundler

ENV RACK_ENV production
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

ENTRYPOINT ["/usr/bin/init"]
CMD ["bin/worker"]
