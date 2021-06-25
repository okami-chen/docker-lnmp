FROM registry.cn-shanghai.aliyuncs.com/okami/docker-lnmp:7.4.19
RUN /etc/init.d/php-fpm start && /etc/init.d/nginx start && /etc/init.d/rsyslog start && /etc/init.d/crond start
CMD ["php","-a"]
