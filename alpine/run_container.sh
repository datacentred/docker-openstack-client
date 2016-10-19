#!/bin/sh

# Install dependencies
apk add --update --no-cache python py-pip git python-dev libffi libffi-dev \
    openssl openssl-dev build-base iputils bash curl linux-headers

# Install client
pip install 'python-openstackclient==3.3.0'

# Install tools
curl -sSL https://raw.githubusercontent.com/gbraad/openstack-tools/master/stack -o /sbin/stack
chmod 0755 /sbin/stack

# Patch fix for Neutron commands
#curl -sSL https://gist.githubusercontent.com/seanhandley/b1343a7adc59df1af16bfcda842278aa/raw/8bc4560f90197fe077c178e521b1aa2b9de574d6/session.py -o /root/client/openstackclient/common/session.py
curl -sSL https://gist.githubusercontent.com/seanhandley/b1343a7adc59df1af16bfcda842278aa/raw/8bc4560f90197fe077c178e521b1aa2b9de574d6/session.py -o /usr/lib/python2.7/site-packages/openstack/session.py
#curl -sSL https://gist.githubusercontent.com/seanhandley/b1343a7adc59df1af16bfcda842278aa/raw/8bc4560f90197fe077c178e521b1aa2b9de574d6/session.py -o /usr/lib/python2.7/site-packages/openstackclient/common/session.py

# Cleanup
apk del build-base linux-headers python-dev libffi-dev openssl-dev
rm -rf /var/cache
