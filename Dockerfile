FROM jekyll/jekyll:pages

COPY Gemfile /srv/jekyll/

WORKDIR /srv/jekyll

RUN apk update && \
	apk add ruby-dev gcc make curl build-base libc-dev libffi-dev zlib-dev libxml2-dev libgcrypt-dev libxslt-dev

RUN gem install json -v 2.7.6
RUN gem install jekyll
RUN gem install bundler -v 2.4.22
RUN gem update --system 3.3.3 

RUN bundle install

EXPOSE 4000 35729