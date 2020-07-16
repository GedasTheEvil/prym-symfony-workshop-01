#!/bin/bash
set -e

STEPS=3
PORT=9000

function PrintBox () {
	echo '=================================================='
	echo $1
	echo '=================================================='
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
	/root/.symfony/bin/symfony new --full prym_workshop_01
fi


echo "Step 3 of ${STEPS}: Running Server on http://localhost:8069"

cd prym_workshop_01
php -S localhost:${PORT}

