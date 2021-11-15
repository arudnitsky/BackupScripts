#!/bin/bash
IPADDR=$(hostname -I | sed 's/.$//')
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
TARDIR='/home/pi/backups'
TARFILE="${TARDIR}/home-pi_${IPADDR}_${TIMESTAMP}.tar.gz"

# echo ${IPADDR}
# echo ${TIMESTAMP}
# echo ${TARFILE}

cd /home

[ ! -d ${TARDIR} ] && mkdir ${TARDIR}
rm -f ${TARDIR}/*.tar.gz
touch ${TARFILE}
tar --exclude=${TARDIR} -czf ${TARFILE} pi
echo "Created $(ls ${TARFILE})"
