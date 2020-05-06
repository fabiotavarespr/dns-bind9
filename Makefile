all: build

build:
	@docker build --tag=fabiotavarespr/dns-server .

docker-run:
	@docker run --rm --name bind -d --publish 53:53/tcp --publish 53:53/udp --volume ${PWD}/.bind9:/data fabiotavarespr/dns-server

docker-stop:
	@docker stop bind