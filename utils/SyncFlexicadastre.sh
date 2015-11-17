#!/bin/bash

# This script syncs the contents of the flexicadastre data server with
# the contents of $local_dir using wget.
# TODO: This script will be run as a cron job.
# TODO: How to check if there was a new file downloaded?
# TODO: If new file downloaded, then run python scripts that checks for
#       changes against CartoDB tables.

remote_dir="http://data.pudo.org/flexicadastre"
local_dir="/home/dev/data/flexicadastre"

cd $local_dir
wget -r -l1 --no-parent -A "flexiscrape*tgz" -nd -nc $remote_dir
