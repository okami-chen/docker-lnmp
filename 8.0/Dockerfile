FROM ubuntu:20.04
LABEL Author="Okami-Chen"
LABEL Version="fpm-8.0.12"
LABEL Description="PHP FPM 8.0"
ENV PHP_VERSION=8.0.22
ENV AMQP_VERSION=1.11.0
ENV REDIS_VERSION=5.3.7
ENV SWOOLE_VERSION=4.8.11
ENV SODIUM_VERSION=1.0.18

WORKDIR /tmp
# COPY ./sources.list /etc/apt/sources.list
COPY ./lnmp.conf /tmp/lnmp.conf
COPY ./lnmp1.8.tar.gz /tmp/lnmp1.8.tar.gz
COPY ./shell /tmp/shell
COPY ./version.sh /tmp/version.sh
COPY ./authorized_keys /tmp/authorized_keys
ADD https://www.php.net/distributions/php-${PHP_VERSION}.tar.bz2 /tmp/php-${PHP_VERSION}.tar.bz2
ADD https://pecl.php.net/get/amqp-${AMQP_VERSION}.tgz /tmp/amqp-${AMQP_VERSION}.tgz
ADD https://github.com/phpredis/phpredis/archive/refs/tags/${REDIS_VERSION}.zip /tmp/phpredis-${REDIS_VERSION}.zip
ADD https://github.com/swoole/swoole-src/archive/refs/tags/v${SWOOLE_VERSION}.tar.gz /tmp/swoole-${SWOOLE_VERSION}.tar.gz
ADD https://github.com/jedisct1/libsodium/archive/refs/tags/${SODIUM_VERSION}.tar.gz /tmp/libsodium-${SODIUM_VERSION}.tar.gz

RUN tar zxf lnmp1.8.tar.gz && cd lnmp1.8 \
    && cat /tmp/lnmp.conf > /tmp/lnmp1.8/lnmp.conf \
    && cat /tmp/version.sh > /tmp/lnmp1.8/include/version.sh \
    && mv /tmp/php-${PHP_VERSION}.tar.bz2 /tmp/lnmp1.8/src/php-${PHP_VERSION}.tar.bz2 \
    && LNMP_Auto="y" DBSelect="0" PHPSelect="11" SelectMalloc="1" ./install.sh lnmp \
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && chmod +x /tmp/shell/*.sh && bash /tmp/shell/ext.sh && bash /tmp/shell/amqp.sh  \
    && bash /tmp/shell/swoole.sh && bash /tmp/shell/redis.sh && bash /tmp/shell/ssh.sh \
#    && bash /tmp/shell/mongo.sh \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /var/lib/apt/lists/* \
    && apt-get clean
