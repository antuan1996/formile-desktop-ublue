#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

echo 'Installing ZeroTier client'
# curl -s \
# https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg \
# | tee /etc/pki/rpm-gpg/RPM-GPG-KEY-zerotier

# cat > /etc/yum.repos.d/zerotier.repo<< EOF
# [zerotier]
# name=ZeroTier, Inc. RPM Release Repository
# baseurl=http://download.zerotier.com/redhat/fc/$releasever
# enabled=1
# gpgcheck=1
# EOF

rpm-ostree install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
rpm-ostree install zerotier-one
systemctl enable zerotier-one.service