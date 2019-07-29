#!/bin/bash

## version 0.1
## limpaLixeira.sh - Script to delete old files from samba trash folders
## created by Sandro Carvalho
## email: carvalho.sandro@gmail.com

DATA=`date +%Y%m%d-%H%M` # Date format for logging
SYNC_LOG="/var/log/$DATA-limpaLixeira.log"; # where the log file will be stored
DAYS="30"; # Dias a ser mantido
LOCAL="/home/samba/shares" # Where will trash folders be located
FOLDER="RecycleBin" # Trash folder name


TRASH=$(find $LOCAL -name $FOLDER) #Searches and stores in the LIXO variable the locations of the trash

find $TRASH -mtime "+$DAYS" -exec rm -rf {} \; >$SYNC_LOG # find and delete files older than $DIAS
find $TRASH -mtime "+$DAYS" -exec ls -la {} \; # Verification command
