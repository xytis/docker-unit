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
  && ./configure php \
  && ./configure python \
  && make all \
  && make install DESTDIR=/usr/

CMD ["/usr/sbin/unitd", "--no-daemon"]
