# prym-symfony-workshop-01
Symfony 4 Workshop for Prym FE

run `bash run-php-docker.sh` or directly

```bash
docker run --rm -it --name prym-symfony-php \
	-v $PWD:/home/app -w /home/app \
	php:7.4-cli bash
```

Then, inside the docker container, run ./setup-symfony.sh

**Note:** If this does not work, we will do the workshop on prym-frontastic

## Agenda

### General
* What is PHP
* What is MVP
* What is composer
* Intro to Twig
* Intro to bundles
* Creating an API endpoint: route, controller, action, response
* Defining services
* A few words about the guzzle client

### Prym Project Specific
* Product expander
* Cart expander
* Decorators vs Expanders
