FROM node:latest

MAINTAINER Kazuma Watanabe

RUN apt-get -y update \
  && apt-get -y install apt-transport-https git-core redis-server

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get -y update \
  && apt-get -y install yarn

RUN git clone https://github.com/wata727/mybot.git \
  && cd mybot \
  && yarn install

CMD cd mybot && bin/hubot --adapter slack