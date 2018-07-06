# Packer LXC CentOS 7

Packages a CentOS 7 Linux Container (LXC).

## Overview

```console
./build
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
