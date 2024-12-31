#!/bin/bash

# Activar la exportación automática de variables
set -a
# Cargar las variables del archivo .env
source .env
set +a

sysbench oltp_read_write --db-driver=pgsql \
						--pgsql-host=$ENDPOINT_RDS \
						--pgsql-user=$USER_RDS \
						--pgsql-password=$PASS_RDS \
						--pgsql-db=$NAME_DATA_BASE \
						--tables=$TOTAL_TABLES \
						--table-size=$SIZE_TABLES \
						--threads=$THREADS \
						--time=$TIME \
						run