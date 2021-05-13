FROM ubuntu:20.04
LABEL Author="Okami-Chen"
LABEL Version="fpm-7.4"
LABEL Description="PHP FPM 7.4"
WORKDIR /tmp
COPY ./sources.list /etc/apt/sources.list
COPY ./lnmp.conf /tmp/lnmp.conf
COPY ./lnmp1.7.tar.gz /tmp/lnmp1.7.tar.gz
COPY ./ext.sh /tmp/ext.sh
COPY ./version.sh /tmp/version.sh
RUN tar zxf lnmp1.7.tar.gz && cd lnmp1.7 \
    && cat /tmp/lnmp.conf > /tmp/lnmp1.7/lnmp.conf \
    && cat /tmp/version.sh > /lnmp1.7/include/version.sh \
    && LNMP_Auto="y" DBSelect="0" PHPSelect="10" SelectMalloc="1" ./install.sh lnmp \
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && chmod +x /tmp/ext.sh && bash /tmp/ext.sh \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /var/lib/apt/lists/* \
    && apt-get clean
