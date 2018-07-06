#!/usr/bin/env sh

set -x

# import keys
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

# wait for network to come up...
until ping -c1 10.0.3.1; do
  sleep 1;
done

# packages
yum install -y curl nc ncdu net-tools rsync tree vim wget

# update root certs
yum reinstall -y ca-certificates
wget -O/etc/pki/tls/certs/ca-bundle.crt http://curl.haxx.se/ca/cacert.pem

# sudo
yum install -y sudo
echo "vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
