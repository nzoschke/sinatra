FROM convox/alpine:3.1

RUN apk-install build-base ca-certificates nginx ruby ruby-dev ruby-io-console postgresql-dev

RUN mkdir -p /var/cache/nginx/body
RUN mkdir -p /var/cache/nginx/fastcgi
RUN mkdir -p /var/cache/nginx/proxy
RUN mkdir -p /var/cache/nginx/scgi
RUN mkdir -p /var/cache/nginx/uwsgi
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

ENV GEM_HOME /var/lib/gem
ENV PATH /var/lib/gem/bin:$PATH
RUN gem install --no-ri --no-rdoc bundler

EXPOSE 3000
ENV PORT 3000
ENV RACK_ENV production

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . /app
