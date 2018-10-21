#	LAMP server setup on Raspberry Pi
[Linux](https://www.linuxfoundation.org/) [Apache](https://httpd.apache.org/) [MySql](https://www.mysql.com/) [PHP](https://secure.php.net/)

##
## First Update and Upgrade
	$ sudo apt-get update
	$ sudo apt-get upgrade -y

##
## Install Apache 2
	$ sudo apt-get install apache2 -y
Enable `mod_rewrite` and restart apache..
```
$ sudo a2enmod rewrite
$ sudo service apache2 restart
```
to allow `.htaccess` override in `/var/www/` change `/etc/apache2/apache2.conf` as
```
<Directory /var/www/>
	Options Indexes FollowSymLinks
	AllowOverride All
	Require all granted
</Directory>
```
and restart apache again.
```
	$ sudo systemctl restart apache2
```
in browser go to `http://<IP of raspberryPi>`

you'll be greeted by **Apache2 Debian Default Page**.

##
## Install PHP
	$ sudo apt-get install php libapache2-mod-php -y
put file `info.php` in `/var/www/html/` as
```
<?php
	phpinfo();
?>
```
in browser go to `hhtp://<IP of raspberryPi>/info.php`

will show lots of info. about your PHP env., now restart apache again.

##
## Install MySQL and [phpMyAdmin](https://www.phpmyadmin.net/)
	$ sudo apt-get install mysql-server php-mysql -y
and restart apache for the last time.

	$ sudo apt-get install phpmyadmin -y

you'll be prompted for configurations..

Choose **[*]  apache2**  with `Spacebar`,  hit `Tab`  then  `Enter`.

Choose **Yes** for configuring database with `dbconfig-common`

then choose your password, verify password and we're done.

Go to browser, hit for `http://<IP of raspberryPi>/phpmyadmin`

you'll be greeted by login screen for phpMyAdmin.

##
## Reconfigure phpMyAdmin
	$ sudo dpkg-reconfigure phpmyadmin
you'll be prompted for same.

##
## Do it using Shell script
Clone the repository in Pi, move to script and execute `lamp_on_pi.sh` as..

	$ git clone https://github.com/gsivaych/raspi
	$ cd raspi/LAMPonPi/
	$ sudo chomd +x lamp_on_pi.sh
	$ ./lamp_on_pi.sh
	
will take a while and prompt for configuartions in the end as above.
