#!/bin/bash

# example call: configure.sh osm-bright.imposm.mml > project.mml

mml_file_name=$1
host="localhost"
port="5432"
dbname="osm"
user="osm"
password="osm"

# adds the necessary connection parameters
#
# 1) deletes all lines with existing entries matching:
#         "dbname":
#
# 2) replaces all entries matching:
#        "type": "postgis"
#    with (see parameter settings above):
#        "host": "localhost", 
#        "port": "5432", 
#        "dbname": "osm", 
#        "user": "osm", 
#        "password": "osm", 
#        "type": "postgis"
    

new_string="        \"host\": \"${host}\", \n        \"port\": \"${port}\", \n        \"dbname\": \"${dbname}\", \n        \"user\": \"${user}\", \n        \"password\": \"${password}\", \n        \"type\": \"postgis\""
sed "/\s*\"dbname\": \".*/d; s/\s*\"type\": \"postgis\"\s*/$new_string/" $mml_file_name
