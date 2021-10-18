FROM ubuntu:21.04
LABEL Author="Okami-Chen"
LABEL Version="fpm-7.2"
LABEL Description="PHP FPM 7.2"
WORKDIR /tmp
COPY ./sources.list /etc/apt/sources.list
COPY ./lnmp.conf /tmp/lnmp.conf
COPY ./lnmp1.7.tar.gz /tmp/lnmp1.7.tar.gz
COPY ./ext.sh /tmp/ext.sh
COPY ./version.sh /tmp/version.sh
COPY ./authorized_keys /tmp/authorized_keys
RUN tar zxf lnmp1.7.tar.gz && cd lnmp1.7 \
    && cat /tmp/lnmp.conf > /tmp/lnmp1.7/lnmp.conf \
    && cat /tmp/version.sh > /tmp/lnmp1.7/include/version.sh \
    && LNMP_Auto="y" DBSelect="0" PHPSelect="8" SelectMalloc="1" ./install.sh lnmp \
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && chmod +x /tmp/ext.sh && bash /tmp/ext.sh \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /var/lib/apt/lists/* \
    && apt-get clean
