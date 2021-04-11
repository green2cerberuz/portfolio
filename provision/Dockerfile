# COMPILE IMAGE
FROM node:15.14.0-buster AS compile-image
LABEL maintainer="green2cerberuz@gmail.com"

ARG USER_ID
ARG GROUP_ID
ARG USERNAME

USER root

ENV APP_HOME /usr/src
WORKDIR $APP_HOME

COPY package.json scripts/user.sh $APP_HOME/

RUN ./user.sh

# RUN npm install yarn
RUN yarn install

COPY . $APP_HOME

RUN chown -R $USER_ID:$GROUP_ID $APP_HOME
# USER NODE

USER $USERNAME





