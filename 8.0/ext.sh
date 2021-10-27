apt-get -y install supervisor rsyslog cron ssh \
&& cd /tmp && wget https://github.com/phpredis/phpredis/archive/refs/tags/5.3.4.zip \
&& unzip 5.3.4.zip && cd phpredis-5.3.4 \
&& phpize && ./configure --with-php-config=/usr/local/php/bin/php-config \
&& make && make install \
&& echo "extension=redis.so" > /usr/local/php/conf.d/redis.ini \
&& wget https://github.com/swoole/swoole-src/archive/master.tar.gz \
&& tar zxvf master.tar.gz \
&& mv swoole-src* swoole-src && cd swoole-src \
&& phpize && ./configure --with-php-config=/usr/local/php/bin/php-config --enable-openssl --enable-sockets --enable-mysqlnd --enable-http2 --enable-swoole-json --enable-swoole-curl \
&& make && make install \
&& echo "extension=swoole.so" > /usr/local/php/conf.d/swoole.ini \
&& pecl install /tmp/amqp-1.11.0beta.tgz \
&& mkdir -p /root/.ssh && cat /tmp/authorized_keys > /root/.ssh/authorized_keys \
&& chmod 600 /root/.ssh/authorized_keys \
&& rm -rf /var/cache/apk/* /tmp/* /usr/share/man /var/lib/apt/lists/*
