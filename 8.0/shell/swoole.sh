cd /tmp && tar zxvf swoole-master.tar.gz \
&& mv swoole-src* swoole-src && cd swoole-src \
&& phpize && ./configure --with-php-config=/usr/local/php/bin/php-config --enable-openssl --enable-sockets --enable-mysqlnd --enable-http2 --enable-swoole-json --enable-swoole-curl \
&& make && make install \
&& echo "extension=swoole.so" > /usr/local/php/conf.d/02_swoole.ini