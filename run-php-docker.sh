#!/bin/bash

APP=$@

if [[ "${APP}" == "" ]]; then
	APP="/bin/bash"
fi

docker run --rm -it --name prym-symfony-php \
	-v $PWD:/home/app -w /home/app \
	php:7.4-cli ${APP}

