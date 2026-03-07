BACKUP_LOCATION=$(cat .env | grep BACKUP_LOCATION | cut -d '=' -f2 | sed -e 's_\\_/_g'|sed -e 's_d:_/mnt/d_')
BACKUP_PATH=/mnt/e/backups/paperless

mkdir -p "$UPLOAD_LOCATION/database-backup"
borg init --encryption=none "$BACKUP_PATH"
