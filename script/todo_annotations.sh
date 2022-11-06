#!/bin/bash
EXPECTED_COUNT=3

OUT=`rails notes --annotations TODO|wc -l`

if [ $OUT -ne $EXPECTED_COUNT ]; then
  echo "Expected $EXPECTED_COUNT TODOs, found $OUT"
  exit 1 # https://www.cyberciti.biz/faq/linux-bash-exit-status-set-exit-statusin-bash
fi