cd /tmp && tar xvf amqp-1.11.0beta.tgz && cd /tmp/amqp-1.11.0beta \
&& /usr/local/php/bin/phpize \
&& /tmp/amqp-1.11.0beta/configure --with-php-config=/usr/local/php/bin/php-config \
&& make && make install \
&& echo "extension=amqp.so" > /usr/local/php/conf.d/amqp.ini