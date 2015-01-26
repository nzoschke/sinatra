FROM ruby:2.2.0

RUN apt-get update
RUN apt-get -y install sudo

RUN apt-get -y install nginx

EXPOSE 3000

RUN useradd -ms /bin/bash app
RUN mkdir -p /app
RUN chown -R app:app /app

WORKDIR /app
ENV PATH /home/app/.gem/bin:$PATH
ENV GEM_HOME /home/app/.gem
RUN sudo -Eu app gem install bundler
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN sudo -Eu app /home/app/.gem/bin/bundle install

ENV PORT 5000
ENV RACK_ENV production
ADD . /app
RUN chown -R app:app /app
RUN chown -R app:app /home/app

RUN mkdir -p /nginx/client_body_temp
RUN mkdir -p /nginx/fastcgi_temp
RUN mkdir -p /nginx/proxy_temp
RUN mkdir -p /nginx/scgi_temp
RUN mkdir -p /nginx/uwsgi_temp
RUN chown -R app:app /nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

USER app

CMD ["bin/web"]
