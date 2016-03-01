#!/bin/bash

USERNAME="username"
PASSWORD="password"

HOSTS="example.com"

WSCRIPT="w"
WHOSCRIPT="who --ips"

while true
do
	./getStats.sh ${USERNAME} ${PASSWORD} "${HOSTS}" ${WSCRIPT} > tmp.txt
	./getWActions.sh tmp.txt >> w.log
	./getStats.sh ${USERNAME} ${PASSWORD} "${HOSTS}" "${WHOSCRIPT}" > tmp.txt
	./getWHOActions.sh tmp.txt >> ip.log
	cat w.log | uniq | sort -o w.log
	cat ip.log | uniq | sort -o ip.log
	uniq w.log w.log
	uniq ip.log ip.log
	rm -f tmp.txt
	sleep 1800
done
