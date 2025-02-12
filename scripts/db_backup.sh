#!/bin/bash

PG_USER="$user_name"
PG_HOST="$host_name"
PG_PORT="5432"
PG_PASS="$pg_pass"
S3_BUCKET="$s3_bucket"
BACKUP_DIR="$backup_dir"


export PGPASSWORD=$PG_PASS


databases=$(psql -h $PG_HOST -U $PG_USER -p $PG_PORT -t -c "SELECT datname FROM pg_database WHERE datistemplate = false;")


for db in $databases
do
    echo "Backing up database: $db"


    BACKUP_FILE="$BACKUP_DIR/$db-$(date +%F).sql.gz"


    pg_dump -h $PG_HOST -U $PG_USER -p $PG_PORT $db | gzip > $BACKUP_FILE

    if [[ $? -eq 0 ]]; then
        echo "Backup for $db completed successfully. Uploading to S3..."


        aws s3 cp $BACKUP_FILE $S3_BUCKET

        if [[ $? -eq 0 ]]; then
            echo "Upload for $db completed successfully."

            rm -f $BACKUP_FILE
        else
            echo "Failed to upload $db backup to S3."
        fi
    else
        echo "Failed to backup $db."
    fi
done


unset PGPASSWORD
