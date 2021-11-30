FROM ubuntu:20.04
LABEL Author="Okami-Chen"
LABEL Version="php-8.0.11"
LABEL Description="PHP FPM 7.4"
ARG timezone

ENV TIMEZONE=${timezone:-"Asia/Shanghai"} \
    LC_ALL=C \
    LC_CTYPE="zh_CN.UTF-8"
WORKDIR /tmp
ADD http://mirrors.linuxeye.com/oneinstack-full.tar.gz /tmp/oneinstack-full.tar.gz
COPY ./sources.list /etc/apt/sources.list
COPY ./options.conf /tmp/options.conf
COPY ./versions.txt /tmp/versions.txt
RUN ln -sf /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && tar xzf oneinstack-full.tar.gz && cat /tmp/options.conf > /tmp/oneinstack/options.conf \
    && cat /tmp/versions.txt > /tmp/oneinstack/versions.txt \
    && ./oneinstack/install.sh --nginx_option 2 --php_option 10 --phpcache_option 1 --php_extensions fileinfo,redis,swoole \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man \
    && apt-get clean && echo "COLUMNS=10000" >> /root/.bashrc \
    && echo -e "\033[42;37m Build Completed :).\033[0m\n"