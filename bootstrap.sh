#!/bin/sh

cd /opt
# Check if first time
if [ -d "/opt/lampp" ]; then # not first time
	echo "Fengoffice already installed."
else # first time
	echo "Fengoffice will be installed."
     # Install XAMPP
	chmod +x xampp-linux-x64-installer.run 
	./xampp-linux-x64-5.6.21-0-installer.run 
	rm xampp-linux-x64-installer.run 
	/opt/lampp/lampp stop 
	rm -rf /opt/lampp/htdocs/ 
	mkdir /opt/lampp/htdocs/
	# Setup Feng Office
	unzip fengoffice.zip -d /opt/lampp/htdocs/ 
	rm fengoffice.zip
	# Create database data dir
	mkdir /opt/lampp/htdocs/fengdata
	# Copy MySql config
	mv /opt/my.cnf /opt/lampp/etc/my.cnf
	chmod 644 /opt/lampp/etc/my.cnf   
	# Set permissions
    chmod -R 775 /opt/lampp/htdocs
fi;
# Run Cron (env > /root/env.txt)
cron
# Run Server
/opt/lampp/lampp start