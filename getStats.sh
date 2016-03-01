#!/bin/bash
USERNAME="$1"
HOSTS="$3"
SCRIPT="$4"
PASSWORD=$2

for HOSTNAME in ${HOSTS} ; do
	sshpass -p ${PASSWORD} ssh -o StrictHostKeyChecking=no -l ${USERNAME} ${HOSTNAME} "${SCRIPT}" | grep -v "USER" | grep -v "load average" | sort
done
