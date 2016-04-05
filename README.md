## Setup

1. Install docker-machine and docker-compose
2. Run `docker-machine create ...`,
   e.g.

        docker-machine create \
            -d virtualbox \
            --virtualbox-memory 2048 \
            --virtualbox-disk-size 40000 \
            joshua-local
        eval "$(docker-machine env joshua-local)"

3. Run `docker-compose build`

## Use

Run the Arabic-to-English decoder like this:

```sh
$ echo 'مرحبا' | docker-compose run --rm joshua
hello
```
