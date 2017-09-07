FROM ubuntu

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl

RUN set -xe; \
	mkdir -p /usr/src; \
	cd /usr/src; \
	\
  curl -o ngx.key http://nginx.org/keys/nginx_signing.key; \
  apt-key add ngx.key; \
  \
  echo "deb http://nginx.org/packages/mainline/ubuntu/ xenial nginx" >> /etc/apt/sources.list; \
  echo "deb-src http://nginx.org/packages/mainline/ubuntu/ xenial nginx " >> /etc/apt/sources.list; \
  apt-get update && apt-get install -y --no-install-recommends \
    unit \
    php \
    python \
    golang

CMD ["unitd", "--no-daemon"]
