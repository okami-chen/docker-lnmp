FROM registry.cn-hangzhou.aliyuncs.com/okami/docker-lnmp:8.1
LABEL maintainer="陈德华 <hua@131.im>" version="1.0" license="MIT" app.name="tws"

WORKDIR /var/www/html

RUN sed -i 's/disable_function/;disable_function/g' /usr/local/php/etc/php.ini \
    && pecl install mongodb