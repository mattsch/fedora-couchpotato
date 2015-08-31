#!/usr/bin/env bash

# Check our uid/gid, change if env variables require it
if [ "$( id -u couchpotato )" -ne "${LUID}" ]; then
    usermod -o -u ${LUID} couchpotato
fi

if [ "$( id -g couchpotato )" -ne "${LGID}" ]; then
    groupmod -o -g ${LGID} couchpotato
fi

# Set permissions
chown -R couchpotato:couchpotato /config/ /opt/couchpotato

exec runuser -l couchpotato -c 'python /opt/couchpotato/app/CouchPotato.py --config_file=/config/config.ini --data_dir=/config/data'
