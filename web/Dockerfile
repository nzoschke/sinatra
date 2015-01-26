FROM ruby:2.2.0

EXPOSE 3000
RUN apt-get update
RUN apt-get -y install nginx
RUN mkdir -p /var/cache/nginx/body
RUN mkdir -p /var/cache/nginx/fastcgi
RUN mkdir -p /var/cache/nginx/proxy
RUN mkdir -p /var/cache/nginx/scgi
RUN mkdir -p /var/cache/nginx/uwsgi
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

ENV GEM_HOME /var/lib/gem
ENV PATH /var/lib/gem/bin:$PATH
RUN gem install bundler

ENV PORT 5000
ENV RACK_ENV production
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app

CMD ["bin/web"]
