FROM ruby:2.2.0

RUN apt-get update
RUN apt-get -y install sudo

RUN apt-get -y install nginx

EXPOSE 3000

WORKDIR /app
ENV PATH /home/app/.gem/bin:$PATH
ENV GEM_HOME /home/app/.gem
RUN gem install bundler
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN /home/app/.gem/bin/bundle install

ENV PORT 5000
ENV RACK_ENV production
ADD . /app

RUN mkdir -p /var/cache/nginx/client_body
RUN mkdir -p /var/cache/nginx/fastcgi
RUN mkdir -p /var/cache/nginx/proxy
RUN mkdir -p /var/cache/nginx/scgi
RUN mkdir -p /var/cache/nginx/uwsgi
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["bin/web"]
