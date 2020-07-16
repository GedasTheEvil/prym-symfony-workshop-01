#!/bin/bash
set -e

STEPS=4
PORT=9000

function PrintBox () {
	echo '============================================================'
	echo $1
	echo '============================================================'
	echo ''
}

function HasInstalled () {
	whereis $1 | awk '{ print $2 }'
}

if [[ ! -f composer.phar ]]; then
	PrintBox "Step 0 of ${STEPS}: Getting composer"
	php -r "copy('https://getcomposer.org/composer-stable.phar', 'composer.phar');" 
fi

PrintBox "Step 1 of ${STEPS}: Installing git"

if [[ $(HasInstalled git) == "" ]]; then
	apt update;
	apt install -y git
	git config --global user.email "workshop-member@prym.de"
  	git config --global user.name "Workshop Member"

fi

PrintBox "Step 2 of ${STEPS}: Installing symfony"

if [[ ! -f "/root/.symfony/bin/symfony" ]]; then
	php -r "copy('https://get.symfony.com/cli/installer', 'installer.sh');"
	bash installer.sh
	if [[ ! -d prym_workshop_01 ]]; then
		/root/.symfony/bin/symfony new --full prym_workshop_01
		chmod 0777 prym_workshop_01/src -R
	fi
fi


if [[ $(HasInstalled ip) == "" ]]; then
	apt install -y iproute2
	IP=$(ip addr | grep eth | grep inet | awk '{ print $2 }' | sed 's/\/[0-9][0-9]//' )
fi

PrintBox "Step 4 of ${STEPS}: Running Server on http://${IP}:${PORT}"


cd prym_workshop_01/public
php -S ${IP}:${PORT}

