# prym-symfony-workshop-01
Symfony 4 Workshop for Prym FE

run `bash run-php-docker.sh` or directly

```bash
docker run --rm -it --name prym-symfony-php \
	-v $PWD:/home/app -w /home/app \
	php:7.4-cli bash
```

Then, inside the docker container, run ./setup-symfony.sh

