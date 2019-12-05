FROM mariadb:10.3.20

LABEL mainteiner="Rogerio M. de Queiroz <rogerio.mq@gmail.com>"

#####################################
# Set Timezone
#####################################

ARG TZ=UTC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && chown -R mysql:root /var/lib/mysql/
# COPY my.cnf /etc/mysql/my.cnf

# RUN chmod -R 644 /etc/mysql/my.cnf

CMD ["mysqld"]

EXPOSE 3306