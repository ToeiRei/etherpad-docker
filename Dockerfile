FROM node:alpine
MAINTAINER Viktoria Rei Bauer, dockermaster@stargazer.at

ENV ETHERPAD_VERSION 1.6.1

RUN apk update && apk upgrade && apk add \
  curl \
  git \
  python \
  supervisor \
  unzip \
  mariadb-client

WORKDIR /opt/

# Grab a release
RUN curl -SL \
    https://github.com/ether/etherpad-lite/archive/${ETHERPAD_VERSION}.zip \
    > etherpad.zip && unzip etherpad && rm etherpad.zip && \
    mv etherpad-lite-${ETHERPAD_VERSION} etherpad-lite

WORKDIR etherpad-lite

RUN bin/installDeps.sh && rm settings.json
ADD assets /

RUN sed -i 's/^node/exec\ node/' bin/run.sh

VOLUME /opt/etherpad-lite/var
RUN ln -s var/settings.json settings.json

RUN chmod +x /entrypoint.sh

# Install the plugins needed:
RUN npm install ep_adminpads ep_authorship_toggle ep_countable ep_push2delete ep_spellcheck ep_user_font_size


EXPOSE 9001
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bin/run.sh", "--root"]
