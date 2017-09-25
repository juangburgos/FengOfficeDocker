#!/bin/sh

cd /opt
# Check if first time
if [ -d "/opt/lampp/htdocs" ]; then # not first time
	echo "Fengoffice already installed."
else # first time
	echo "Fengoffice will be installed."
     # Install XAMPP
	chmod +x xampp-linux-x64-installer.run 
	./xampp-linux-x64-installer.run
	rm xampp-linux-x64-installer.run 
	/opt/lampp/lampp stop 
	rm -rf /opt/lampp/htdocs/ 
	mkdir /opt/lampp/htdocs/
	# Setup Feng Office
	unzip fengoffice.zip -d /opt/lampp/htdocs/ 
	rm fengoffice.zip
	# Create database data dir
	mkdir /opt/lampp/htdocs/fengdata
	# Set permissions (IMPORTANT)
	chmod 777 /opt/lampp/htdocs/fengdata
	# Copy MySql config
	mv /opt/my.cnf /opt/lampp/etc/my.cnf
	chmod 644 /opt/lampp/etc/my.cnf   
	# Set permissions (IMPORTANT)
	chmod -R 777 /opt/lampp/htdocs/config
    chmod -R 777 /opt/lampp/htdocs/cache
    chmod -R 777 /opt/lampp/htdocs/upload
    chmod -R 777 /opt/lampp/htdocs/tmp
fi;
# Run Cron (env > /root/env.txt)
cron
# Run Server
/opt/lampp/lampp start
# Wait indef
tail -f /dev/null