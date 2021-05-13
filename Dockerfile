FROM registry.cn-shanghai.aliyuncs.com/okami/docker-lnmp:7.4.19
RUN /etc/init.d/php-fpm start && /etc/init.d/nginx start
CMD ["php","-a"]
