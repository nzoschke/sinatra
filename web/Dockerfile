FROM ruby:2.2.0

RUN apt-get update
RUN apt-get -y install sudo

RUN useradd -ms /bin/bash app
RUN mkdir -p /app
RUN chown -R app:app /app

WORKDIR /app

EXPOSE 5000
ENV PORT 5000

ENV PATH /home/app/.gem/bin:$PATH
ENV GEM_HOME /home/app/.gem
RUN sudo -Eu app gem install bundler
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN sudo -Eu app /home/app/.gem/bin/bundle install

ENV RACK_ENV production

ADD . /app
RUN chown -R app:app /app
RUN chown -R app:app /home/app
USER app

CMD ["bin/web"]
