FROM library/node:lts-alpine

ENV HUBOT_VERSION 3.3.2

ENV HUBOT_NAME robot
ARG HUBOT_OWNER="Roman Komkov <roman.komkov@gmail.com>"
ARG HUBOT_DESCRIPTION="Hubot robot. Born to serve."

ENV HUBOT_HOME /home/hubot

RUN npm install -g coffeescript yo generator-hubot@next

RUN addgroup -g 501 hubot && \
    adduser -D -h $HUBOT_HOME -u 501 -G hubot hubot

WORKDIR $HUBOT_HOME

USER hubot

RUN yo hubot --no-insight \
             --adapter=slack \
             --owner="$HUBOT_OWNER" \
             --name="$HUBOT_NAME" \
             --description="$HUBOT_DESCRIPTION" \
             --defaults

COPY entrypoint.sh ./

ENTRYPOINT ["./entrypoint.sh"]

CMD ["--name", "$HUBOT_NAME", "--adapter", "slack"]
