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

# set volume
VOLUME [ "/var/www" ]

# copy run file
COPY scripts/run.sh /home/www-data/run.sh
RUN chmod +x /home/www-data/run.sh

ENTRYPOINT ["/home/www-data/run.sh", "su", "-m", "www-data","-c","/bin/bash"]
