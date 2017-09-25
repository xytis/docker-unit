FROM alpine:3.6

RUN apk add --no-cache --virtual .build-deps \
 git \
 gcc \
 libc-dev \
 make \
 python3 \
 python3-dev \
 php7-embed \
 php7-dev

RUN set -xe; \
  \
  git clone https://github.com/nginx/unit src \
  && cd src \
  && ./configure \
  && ./configure php    --module=php7     --config=php-config7    \
  && ./configure python --module=python3  --config=python3-config \
  && make all \
  && make install DESTDIR=/usr/

ADD unitd-entrypoint /usr/sbin/unitd-entrypoint

ENTRYPOINT ["/usr/sbin/unitd-entrypoint"]
CMD ["unitd", "--no-daemon"]
