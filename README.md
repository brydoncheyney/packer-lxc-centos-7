# Packer LXC CentOS 7

Packages CentOS 7 Linux Containers (LXC).

## Requirements

- [Docker](https://www.docker.com/)

## Overview

The docker container will build two boxes

- centos-7-server_lxc.box (~548M)
- centos-7-server-minimal_lxc.box (~166M)

The `centos-7-server_lxc.box` installs the Core and Base package groups.

```console
make all
```

The boxes will be packaged in the `./builds` folder!

### Docker Container

```console
make docker
```

### Build Linux Container

```console
make run
```

### Provision Linux Containers

```console
vagrant up (server|minimal)
```

## Known Issues

```console
$ ping -c1 github.com
ping: socket: Operation not permitted
$ getcap $(which ping)
$ sudo setcap 'cap_net_admin,cap_net_raw+ep' /usr/bin/ping
$ getcap $(which ping)
/usr/bin/ping = cap_net_admin,cap_net_raw+p
$ ping -c1 github.com
PING github.com (192.30.253.112) 56(84) bytes of data.
64 bytes from lb-192-30-253-112-iad.github.com (192.30.253.112): icmp_seq=1 ttl=46 time=214 ms
```

- https://bugzilla.redhat.com/show_bug.cgi?id=1475871
- https://review.openstack.org/#/c/125428/

### centos-7-server_lxc

Bringing this box up in Vagrant takes longer than the default `fetch_ip_tries`
of 10 -

```yaml
    instance.vm.provider :lxc do |lxc|
      lxc.fetch_ip_tries = 30
    end
```
