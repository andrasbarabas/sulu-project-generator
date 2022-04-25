FROM ubuntu:20.04 as base

LABEL maintainer="András Barabás <barabasandras1@gmail.com>"

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /usr/src

# Install packages
RUN apt update \
  && apt install --yes software-properties-common \
  && add-apt-repository ppa:ondrej/php \
  && apt install --yes git php8.1 php8.1-xml php8.1-gd unzip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
COPY ./docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

RUN chmod +x /docker-entrypoint.sh
