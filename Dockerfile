FROM debian:stable-backports
RUN apt-get update && apt-get dist-upgrade -y
ADD . /opt/www
WORKDIR /opt/www
CMD ./orangeforum
