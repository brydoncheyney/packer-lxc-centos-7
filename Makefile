all: deps docker run

.PHONY: run clean

clean:
	vagrant destroy -f
	vagrant box remove builds/lxc-centos-7-server.box

packer:
	curl -s https://releases.hashicorp.com/packer/1.2.4/packer_1.2.4_linux_amd64.zip | gunzip - > packer
	chmod +x packer

deps: packer

docker: deps
	docker build --tag packer .

run:
	docker run --volume ${PWD}:/packer --volume /sys/fs/cgroup:/sys/fs/cgroup:ro --privileged -it packer centos-7-server.json
