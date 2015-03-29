#!/bin/bash
# boot moco stub server

configure_files=$(find . -name *_conf.json)
if [ "$1" == "start" ]; then
    moco start -p 12306 -c $configure_files -s 9527
elif [ "$1" == "stop" ]; then
    moco shutdown -s 9527
else
    moco start -p 12306 -c $configure_files -s 9527
    echo $configure_files
fi
