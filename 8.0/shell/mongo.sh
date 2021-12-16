cd /tmp && unzip mongodb-${MONGODB_VERSION}.zip && cd mongodb-${MONGODB_VERSION} \
&& phpize && ./configure --with-php-config=/usr/local/php/bin/php-config \
&& make && make install \
&& echo "extension=mongodb.so" > /usr/local/php/conf.d/05_mongodb.ini