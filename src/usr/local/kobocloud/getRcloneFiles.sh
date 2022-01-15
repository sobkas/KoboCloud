#!/bin/sh

baseURL="$1"
outDir="$2"

#load config
. $(dirname $0)/config.sh

rclone_config=""$UserConfig"_rclone.conf"

# Strip "RCLONE " from baseURL to get rclone path
baseURL=`echo ${baseURL} | sed 's/^[^ ]* //'`

# Rclone sync from baseURL (now RCLONE path) to outDir
${RCLONE} copy --config ${rclone_config} --drive-acknowledge-abuse --no-check-certificate ${baseURL} ${outDir}
