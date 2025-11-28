# zabbix-bruxelles
Training course Zabbix for Bruxelles transportation system



## Change zabbix to port 32111
```shell
 cd /etc/httpd/conf
 sudo vi httpd.conf
 # Listen change port to 32111
sudo semanage port -a -t http_port_t -p tcp 32111
Check
```