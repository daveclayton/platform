#!/bin/bash

UPLOAD_LOCATION=$(cat .env | grep UPLOAD_LOCATION | cut -d '=' -f2 | sed -e 's_\\_/_g'|sed -e 's_d:_/mnt/d_')
BACKUP_PATH=/mnt/e/backups

echo Dumping database to "$UPLOAD_LOCATION"/database-backup/immich-database.sql
docker exec -t immich_postgres pg_dumpall --clean --if-exists --username=postgres > "$UPLOAD_LOCATION"/database-backup/immich-database.sql

echo "Creating borg backup of $UPLOAD_LOCATION to $BACKUP_PATH/immich-borg"
borg create "$BACKUP_PATH/immich-borg::{now}" "$UPLOAD_LOCATION" --exclude "$UPLOAD_LOCATION"/thumbs/ --exclude "$UPLOAD_LOCATION"/encoded-video/
echo "Pruning old backups and compacting the repository"
borg prune --keep-weekly=4 --keep-monthly=3 "$BACKUP_PATH"/immich-borg
echo "Compacting borg repository to save space"
borg compact "$BACKUP_PATH"/immich-borg