apt-get -y install supervisor rsyslog cron \
&& cd /tmp && wget https://github.com/phpredis/phpredis/archive/refs/tags/5.3.4.zip \
&& unzip 5.3.4.zip && cd phpredis-5.3.4 \
&& phpize && ./configure --with-php-config=/usr/local/php/bin/php-config \
&& make && make install \
&& echo "extension=redis.so" > /usr/local/php/conf.d/redis.ini \
&& wget https://github.com/swoole/swoole-src/archive/master.tar.gz \
&& tar zxvf master.tar.gz \
&& mv swoole-src* swoole-src && cd swoole-src \
&& phpize && ./configure --with-php-config=/usr/local/php/bin/php-config --enable-openssl --enable-sockets --enable-mysqlnd --enable-http2 \
&& make && make install \
&& echo "extension=swoole.so" > /usr/local/php/conf.d/swoole.ini \
&& rm -rf /var/cache/apk/* /tmp/* /usr/share/man /var/lib/apt/lists/* \
&& sed -i 's/session/#session/g' /etc/pam.d/crond

# && sed -i 's/php-7.4.12/php-7.4.19/g' /tmp/lnmp1.7/include/version.sh \
# && sed -i "" "s/disable_functions/#disable_functions/g" /usr/local/php/etc/php.ini \
# && apt-get -y install supervisor \
