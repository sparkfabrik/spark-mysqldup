#!/bin/bash

export SRC_HOST=${SRC_HOST}
export SRC_NAME=${SRC_NAME}
export SRC_USER=${SRC_USER}
export SRC_PASS=${SRC_PASS}
export SRC_PORT=${SRC_PORT:-"3306"}
export DST_HOST=${DST_HOST}
export DST_NAME=${DST_NAME}
export DST_USER=${DST_USER}
export DST_PASS=${DST_PASS}
export DST_PORT=${DST_PORT:-"3306"}

DUMP_OPTIONS="--single-transaction --quick --skip-lock-tables --max-allowed-packet=1000000000"

# Drop and recreate destination DB
mysql -u${DST_USER} -p${DST_PASS} -h${DST_HOST} -P{$DST_PORT} --execute "DROP DATABASE IF EXISTS ${DST_NAME}"
mysql -u${DST_USER} -p${DST_PASS} -h${DST_HOST} -P${DST_PORT} --execute "CREATE DATABASE ${DST_NAME}"

# Dump source DB
mysqldump -u${SRC_USER} -p${SRC_PASS} -h${SRC_HOST} -P${SRC_PORT} $DUMP_OPTIONS ${SRC_NAME} > dump.sql

# Import into destination DB
mysql -u${DST_USER} -p${DST_PASS} -h${DST_HOST} -P${DST_PORT} < dump.sql

echo "DB Dup Operation Complete!"
