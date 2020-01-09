#!/bin/bash
if [[ $# -ne 2 ]] ; then
	echo "usage: ./start.sh DOMAIN IP"
	exit
fi

DOMAIN=$1
IP=$2

rm -rf conf/
mkdir conf/
cp _conf/* conf/
sed -i "s/_MYDOMAIN_/$DOMAIN/g;s/_MYIP_/$IP/g" conf/*

touch logfile
chmod 777 logfile


docker run -d --rm --name bind9 -p $IP:53:53 -p $IP:53:53/udp -v $(pwd)/logfile:/var/log/named/named.log -v $(pwd)/conf/named.conf:/etc/bind/named.conf -v  $(pwd)/conf/myzone.db:/etc/bind/master/myzone.db resystit/bind9:latest  /usr/sbin/named -c /etc/bind/named.conf -u named -f
