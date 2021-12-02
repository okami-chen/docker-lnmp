cd /tmp && tar xvf amqp-${AMQP_VERSION}.tgz && cd /tmp/amqp-${AMQP_VERSION} \
&& /usr/local/php/bin/phpize \
&& /tmp/amqp-1.11.0beta/configure --with-php-config=/usr/local/php/bin/php-config \
&& make && make install \
&& echo "extension=amqp.so" > /usr/local/php/conf.d/03_amqp.ini