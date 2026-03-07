#!/bin/bash

BACKUP_LOCATION=$(cat .env | grep BACKUP_LOCATION | cut -d '=' -f2 | sed -e 's_\\_/_g'|sed -e 's_d:_/mnt/d_')
BACKUP_PATH=/mnt/e/backups

echo Dumping contents database to /usr/src/paperless/backup
docker exec -t paperless-webserver-1 document_exporter /usr/src/paperless/backup



echo "Creating borg backup of $BACKUP_LOCATION to $BACKUP_PATH/paperless"
borg create --progress "$BACKUP_PATH/paperless::{now}" "$BACKUP_LOCATION"
echo "Pruning old backups and compacting the repository"
borg prune --progress --keep-weekly=4 --keep-monthly=3 "$BACKUP_PATH"/paperless
echo "Compacting borg repository to save space"
borg compact --progress "$BACKUP_PATH"/paperless