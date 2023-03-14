#!/bin/bash

# This is a script helps a user to backup their works in a specific folder to a specific backup directory (/home/$USER/work_backup)
 
# The script requires two parameters - the first is where the log file will be and the second is what directory will be backed up.
# To complete the automation, add the script to your cron job

if [ -z "$1" ] || [ -z "$2" ]; then

       echo "one or no parameter was not passed"
       echo "note that all files being backed up will be in /home/\$USER/backup"
       echo "USAGE: ./backup.sh LOG DIR-TO-BE-BACKED-UP"
       exit 255;
fi

LOG=$1
BACKUP_DIR=$2

echo "starting backup at $(date "+%D +%T")" >> $LOG

echo "creating backup dir" >> $LOG

if ! (mkdir /home/$USER/backup 2> /dev/null)

then
        echo "Dir exists" >> $LOG
fi

echo "Copying files" >> $LOG
cp -v $BACKUP_DIR/* /home/$USER/backup >> $LOG
echo "Completed..." >> $LOG
echo "Backup completed at $(date +"%D +%T")" >> $LOG
