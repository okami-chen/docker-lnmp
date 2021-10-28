cd /tmp && wget https://github.com/phpredis/phpredis/archive/refs/tags/5.3.4.zip \
&& unzip 5.3.4.zip && cd phpredis-5.3.4 \
&& phpize && ./configure --with-php-config=/usr/local/php/bin/php-config \
&& make && make install \
&& echo "extension=redis.so" > /usr/local/php/conf.d/redis.ini