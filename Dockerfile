FROM ubuntu:14.04
MAINTAINER juangburgos@gmail.com

# Update
RUN apt-get update

# Install necessary tools
RUN apt-get -y install cron \
&& apt-get -y install wget \
&& apt-get -y install unzip

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/fengtasks 
RUN chmod 0644 /etc/cron.d/fengtasks
# Add custom MySql config
ADD my.cnf /opt/my.cnf

# Define data volumes
VOLUME ["/opt/lampp"]

# Expose web
EXPOSE 80

# Download XAMPP
RUN wget -O /opt/xampp-linux-x64-installer.run https://www.apachefriends.org/xampp-files/5.6.21/xampp-linux-x64-5.6.21-0-installer.run
# Download Feng Office
RUN wget -O /opt/fengoffice.zip https://sourceforge.net/projects/opengoo/files/fengoffice/fengoffice_3.4.2.2/fengoffice_3.4.2.2.zip

# Add custom bootstrap script
ADD bootstrap.sh /opt/bootstrap.sh 
RUN chmod +x /opt/bootstrap.sh

# RUN cron : http://dev.im-bot.com/docker-cron/
CMD ./opt/bootstrap.sh