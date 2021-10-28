cd /tmp && unzip phpredis-${REDIS_VERSION}.zip && cd phpredis-${REDIS_VERSION} \
&& phpize && ./configure --with-php-config=/usr/local/php/bin/php-config \
&& make && make install \
&& echo "extension=redis.so" > /usr/local/php/conf.d/01_redis.ini