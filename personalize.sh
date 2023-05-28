#! /bin/bash

#
# Individualize Snowflake role, database, and warehouse with a prefix
#

PREFIX=$1

if [ -z "${PREFIX}" ]
then
	echo "Missing command line argument to use as prefix"
	exit
fi

find . -type f \( -name "*.sql" -o -name "*.py" -o -name "*.toml" \) -exec sed -i "s/\bHOL_ROLE\b/${PREFIX}_HOL_ROLE/g" {} +
find . -type f \( -name "*.sql" -o -name "*.py" -o -name "*.toml" \) -exec sed -i "s/\bHOL_DB\b/${PREFIX}_HOL_DB/g" {} +
find . -type f \( -name "*.sql" -o -name "*.py" -o -name "*.toml" \) -exec sed -i "s/\bHOL_WH\b/${PREFIX}_HOL_WH/g" {} +

sed -i "s/\bHOL_ROLE\b/${PREFIX}_HOL_ROLE/g" ~/.snowsql/config
sed -i "s/\bHOL_DB\b/${PREFIX}_HOL_DB/g" ~/.snowsql/config
sed -i "s/\bHOL_WH\b/${PREFIX}_HOL_WH/g" ~/.snowsql/config

