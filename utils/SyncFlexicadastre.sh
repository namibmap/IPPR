#!/bin/bash

# This script syncs the contents of the flexicadastre data server with
# the contents of $local_dir using wget.
# TODO: This script will be run as a cron job.
# TODO: How to check if there was a new file downloaded?
# TODO: If new file downloaded, then run python scripts that checks for
#       changes against CartoDB tables.
# TODO: Keep output messages on a logfile in a log directory.

remote_dir="http://data.pudo.org/flexicadastre"
local_dir="/home/dev/data/flexicadastre"

#Check if destination folder exits, exit otherwise
if [ -d $local_dir ]; then
    cd $local_dir   
    wget -r -l1 --no-parent -A "flexiscrape*tgz" -nd -nc $remote_dir
else
    echo "Destination folder doesn't exist. The data haven't been synchronized."
fi
