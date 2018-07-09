all: deps docker run

https://releases.hashicorp.com/packer/1.2.4/packer_1.2.4_linux_amd64.zip

packer:
	curl -s https://releases.hashicorp.com/packer/1.2.4/packer_1.2.4_linux_amd64.zip | gunzip - > packer
	chmod +x packer

deps: packer

docker:
	docker build --tag packer .

run:
	docker run --volume ${PWD}:/packer --privileged -it packer centos-7-server.json
