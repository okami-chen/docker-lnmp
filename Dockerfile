FROM ubuntu:20.04
WORKDIR /tmp
COPY source.list /etc/apt/source.list
RUN apt-get update -y --fix-missing && apt-get upgrade -y && apt-get -y install wget \
    && wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz \
    && tar xzf oneinstack-full.tar.gz \
    && ./oneinstack/install.sh --nginx_option 1 --php_option 9 --phpcache_option 1 --php_extensions fileinfo,redis,swoole --redis