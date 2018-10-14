#	Raspberry Pi Headless Setup

##	OS
Burn [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) or the one you want using [Etcher](https://etcher.io/).

##	Enable SSH and connect to wifi
Put `ssh` and `wpa_supplicant.conf` files onto boot partition.
Alternatively put
```
country = IN
network = {
    ssid = "Wifi_name"
    psk = "Wifi_password"
}
```
to /etc/wpa_supplicant/wpa_supplicant.conf

##	Boot your pi
Wait 90 seconds

##	Look out for pi's IP from your router's DCHP client's list
[Getting IP](https://www.raspberrypi.org/documentation/remote-access/ip-address.md)

##	SSH into your pi
	$ ssh pi@<IP>
Login using default credentials -
```
username : pi
password : raspberry
```
[More](https://www.raspberrypi.org/documentation/remote-access/ssh/)

##	Update/upgrade
	$ sudo apt-get update
	$ sudo apt-get upgrade

##	Change password from default
	$ passwd

##	Add new user with same permissions as pi
	$ sudo useradd -m <username> -G sudo
	$ sudo passwd <username>

##	Switching user
	$ su - <username>

##	To delete user
	$ sudo deluser <username>
or to delete Home folder as well..
```
$ sudo deluser -remove-home <username>
```
if needed you can end the processes using [kill command](https://en.wikipedia.org/wiki/Kill_(command)).
##	Changing auto-login user
	$ sudo vi /etc/lightdm/lightdm.conf
and make change as `autologin-user = <username>`

##	Renaming 'pi' user
Pretty Detailed instructions [here](http://unixetc.co.uk/2016/01/07/how-to-rename-the-default-raspberry-pi-user/).

##	Static IP
Append file `dhcpd.conf` located in the /etc folder
```
interface eth0 
static ip_address = 192.168.1.100/24 
static routers = 192.168.1.1 
static domain_name_servers = 192.168.1.1 

interface wlan0 
static ip_address = 192.168.1.100/24 
static routers = 192.168.1.1 
static domain_name_servers = 192.168.1.1
```
##	Graphical Desktop Sharing using [VNC](https://www.realvnc.com/)
	$ sudo apt-get update
	$ sudo apt-get install realvnc-vnc-server
	$ vncserver :1
get the IP addr with
```
$ hostname -I
```
put in VNC viewer hostname as `IP:1`
##	Pi as a wireless access point
Running a [standalone network](https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md).

