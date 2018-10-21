#!/bin/bash
#title		:	lamp_on_pi.sh
# Linux Apache MySQL PHP server setup on RaspberryPi

# hostname and IP
hostname
hostname -I

# update upgrade pi
sudo apt-get update
sudo apt-get upgrade -y

# install Apache, enable mod_rewrite, and restart apache
sudo apt-get install apache2 -y
sudo a2enmod rewrite
sudo systemctl restart apache2

# allow .htaccess overides in /etc/www and restart apache
sudo sed -i '172s/None/All/' /etc/apache2/apache2.conf
sudo service apache2 restart

# install PHP, /info.php, and restart apache again
sudo apt-get install php libapache2-mod-php -y
sudo mv info.php /var/www/html/
sudo systemctl restart apache2

# install MySQL and restart server again
sudo apt-get install mysql-server php-mysql -y
sudo service apache2 restart

# install php_myadmin
sudo apt-get install phpmyadmin -y

# again hostname and IP
hostname
hostname -I
