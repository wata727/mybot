FROM node:latest

MAINTAINER Kazuma Watanabe

RUN apt-get -y update \
  && apt-get -y install apt-transport-https git-core redis-server

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get -y update \
  && apt-get -y install yarn

RUN mkdir -p /mybot
COPY . /mybot
WORKDIR /mybot

RUN yarn install

CMD ["bin/hubot", "--adapter", "slack"]
