FROM openjdk:alpine

# Install yarn
RUN apk update && apk upgrade && \
    apk --update add --no-cache --virtual .build-deps-streama ca-certificates wget git && \
    rm -rf /var/cache/apk/* && \
    update-ca-certificates && \
    wget https://github.com/dularion/streama/releases/download/v1.0.11/streama-1.0.11.war -O /usr/local/bin/streama.war && \
    chmod u+x /usr/local/bin/streama.war && \
    apk del .build-deps-streama

CMD ["/usr/local/bin/streama.war"]
