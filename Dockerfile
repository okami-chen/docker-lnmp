FROM ubuntu:20.04
LABEL Author="Okami-Chen"
LABEL Version="fpm-7.4"
LABEL Description="PHP FPM 7.4"
WORKDIR /tmp
COPY ./sources.list /etc/apt/sources.list
COPY ./lnmp.conf /tmp/lnmp.conf
COPY ./lnmp1.7.tar.gz /tmp/lnmp1.7.tar.gz
RUN tar zxf lnmp1.7.tar.gz && cd lnmp1.7 \
    && cat /tmp/lnmp.conf > /tmp/lnmp1.7/lnmp.conf \
    && sed -i '/s/php-7.4.12/php-7.4.19/g' /tmp/lnmp1.7/include/version.sh \
    && LNMP_Auto="y" DBSelect="0" PHPSelect="10" SelectMalloc="1" ./install.sh lnmp \
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && wget https://github.com/swoole/swoole-src/archive/master.tar.gz \
    && tar zxvf master.tar.gz \
    && mv swoole-src* swoole-src && cd swoole-src \
    && phpize && ./configure --with-php-config=/usr/local/php/bin/php-config --enable-openssl --enable-sockets --enable-mysqlnd --enable-http2 --enable-swoole-json \
    && make && make install \
    && echo "extension=swoole.so" > /usr/local/php/conf.d/swoole.ini
    && cd /tmp && wget https://github.com/phpredis/phpredis/archive/refs/tags/5.3.4.zip \
    && unzip 5.3.4.zip && cd phpredis-5.3.4 \
    && phpize && ./configure --with-php-config=/usr/local/php/bin/php-config
    && make && make install \
    && echo "extension=redis.so" > /usr/local/php/conf.d/redis.ini
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /var/lib/apt/lists/* \
    && apt-get clean
