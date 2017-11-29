#!/bin/bash

# example call: configure.sh osm-bright.imposm.mml > project.mml

mml_file_name=$1
host="localhost"
port="5432"
dbname="osm"
user="osm"
password="osm"

new_string="        \"host\": \"${host}\", \n        \"port\": \"${port}\", \n        \"dbname\": \"${dbname}\", \n        \"user\": \"${user}\", \n        \"password\": \"${password}\", \n        \"type\": \"postgis\""
sed "/\s*\"dbname\": \".*/d; s/\s*\"type\": \"postgis\"\s*/$new_string/" $mml_file_name
