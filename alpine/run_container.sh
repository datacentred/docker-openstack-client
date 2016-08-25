#!/bin/sh

# Install dependencies
apk add --update --no-cache python py-pip git python-dev libffi libffi-dev \
    openssl openssl-dev build-base iputils bash curl linux-headers

# Install client
git clone https://github.com/openstack/python-openstackclient.git /root/client
cd /root/client
git fetch --tags
git checkout tags/2.3.0 -b v2.3.0
pip install --no-cache-dir .

# Install tools
curl -sSL https://raw.githubusercontent.com/gbraad/openstack-tools/master/stack -o /sbin/stack
chmod 0755 /sbin/stack

# Cleanup
apk del build-base linux-headers python-dev libffi-dev openssl-dev
rm -rf /var/cache
