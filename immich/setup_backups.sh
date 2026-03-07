UPLOAD_LOCATION=$(cat .env | grep UPLOAD_LOCATION | cut -d '=' -f2 | sed -e 's_\\_/_g'|sed -e 's_d:_/mnt/d_')
BACKUP_PATH=/mnt/e/backups/immich-borg

mkdir -p "$UPLOAD_LOCATION/database-backup"
borg init --encryption=none "$BACKUP_PATH"
