FROM ubuntu:20.04
LABEL Author="Okami-Chen"
LABEL Version="fpm-7.4"
LABEL Description="PHP FPM 7.4"
WORKDIR /tmp
ADD ./source.list /etc/apt/source.list
RUN apt-get update -y --fix-missing && apt-get upgrade -y && apt-get -y install wget \
    && wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz \
    && tar xzf oneinstack-full.tar.gz \
    && ./oneinstack/install.sh --nginx_option 1 --php_option 9 --phpcache_option 1 --php_extensions fileinfo,redis,swoole \
    && php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /var/lib/apt/lists/* \
    && apt-get clean