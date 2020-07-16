#!/bin/bash

APP=$@
PORT_9000=8069

if [[ "${APP}" == "" ]]; then
	APP="/bin/bash"
fi

docker run --rm -it --name prym-symfony-php \
	-v $PWD:/home/app -w /home/app \
	-e "PORT=9000" -p ${PORT_9000}:9000  \
	php:7.4-cli ${APP}

