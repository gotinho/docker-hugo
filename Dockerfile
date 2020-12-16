FROM alpine:3.12

ENV HUGO_VERSION 0.79.0
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN apk add --no-cache tar curl libc6-compat libstdc++ \
    && mkdir /usr/local/hugo \
    && mkdir /site \
    && curl -sL -o /tmp/hugo.tar.gz https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} \
    && tar -xzvf /tmp/hugo.tar.gz -C /usr/local/hugo/ \
    && ln -s /usr/local/hugo/hugo /usr/local/bin/hugo

WORKDIR /site

EXPOSE 1313

CMD [ "hugo" ]
