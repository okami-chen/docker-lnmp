FROM ubuntu:20.04
LABEL Author="Okami-Chen"
LABEL Version="fpm-7.4"
LABEL Description="PHP FPM 7.4"
WORKDIR /tmp
ADD ./source.list /etc/apt/source.list
COPY ./lnmp.conf /tmp/lnmp.conf
RUN apt-get update -y --fix-missing && apt-get upgrade -y && apt-get -y install wget \
    && http://soft.vpser.net/lnmp/lnmp1.7.tar.gz -cO lnmp1.7.tar.gz \
    && tar zxf lnmp1.7.tar.gz && cd lnmp1.7 \
    && cat /tmp/lnmp.conf > /tmp/lnmp1.7/lnmp.conf \
    && LNMP_Auto="y" DBSelect="0" PHPSelect="10" SelectMalloc="1" ./install.sh lnmp \
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /var/lib/apt/lists/* \
    && apt-get clean
