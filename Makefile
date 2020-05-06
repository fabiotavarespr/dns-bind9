all: build

build:
	@docker build --tag=fabiotavarespr/dns-bind9:9.11.3 .
	@docker build --tag=fabiotavarespr/dns-bind9:latest .

push:
	@docker push fabiotavarespr/dns-bind9:9.11.3
	@docker push fabiotavarespr/dns-bind9:latest 

docker-run:
	@docker run --rm --name bind -d --publish 53:53/tcp --publish 53:53/udp --volume ${PWD}/.bind9:/data fabiotavarespr/dns-bind9

docker-stop:
	@docker stop bind