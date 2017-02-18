FROM alpine:edge
MAINTAINER Liam Martens (hi@liammartens.com)

# add www-data user
RUN adduser -D www-data

# run updates
RUN apk update && apk upgrade

# add default packages
RUN apk add --update tzdata bash wget curl sudo nano htop perl

# add node
RUN apk add --update nodejs

# chown timezone files
RUN touch /etc/timezone /etc/localtime && \
    chown www-data:www-data /etc/localtime /etc/timezone

# create directory
RUN mkdir /var/www /home/www-data/.node_modules && \
    chown www-data:www-data /var/www /home/www-data/.node_modules

# set volume
VOLUME [ "/var/www" ]

# copy run file
COPY scripts/run.sh /home/www-data/run.sh
RUN chmod +x /home/www-data/run.sh
COPY scripts/continue.sh /home/www-data/continue.sh
RUN chmod +x /home/www-data/continue.sh

ENTRYPOINT ["/home/www-data/run.sh", "su", "-m", "www-data", "-c", "/home/www-data/continue.sh /bin/bash"]
