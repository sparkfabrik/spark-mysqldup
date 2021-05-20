# Spark MySQL Dup

Container meant to be run as a job that dumps a MySQL database and copies it into another database.

The container **requires** the following ENV vars to be set.

```
# For source DB
SRC_HOST
SRC_NAME
SRC_USER
SRC_PASS
SRC_PORT

# For destination DB
DST_HOST
DST_NAME
DST_USER
DST_PASS
DST_PORT
```
