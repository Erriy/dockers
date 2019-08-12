#!/bin/sh

sport=8000
tport=9000


while getopts "s:t:" opt
do
    case $opt in
        s)
        sport=$OPTARG
        ;;
        t)
        tport=$OPTARG
        ;;
        ?)
        echo "未知参数"
        exit 1;;
    esac
done

echo "PORT = $tport\nUSERS = {\"tg\": \"fe25d41d8cd98f00b2040998ecf8427e\"}" > /mtprotoproxy/config.py

python /mtprotoproxy/mtprotoproxy.py &
ssserver -s 0.0.0.0 -p $sport -k niangxipi -m rc4-md5

