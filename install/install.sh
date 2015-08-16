#!/bin/bash

# Script to set up dependencies for Django on Vagrant.

PGSQL_VERSION=9.4

# Need to fix locale so that Postgres creates databases in UTF-8
cp -p /vagrant/install/etc-bash.bashrc /etc/bash.bashrc
locale-gen en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
dpkg-reconfigure locales

# Install essential packages from Apt
echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  sudo apt-key add -

curl -sL https://deb.nodesource.com/setup_0.12 | bash -

apt-get install -y \
    python-dev \
    python3-dev \
    build-essential \
    git \
    postgresql-$PGSQL_VERSION \
    postgresql-contrib-$PGSQL_VERSION \
    libpq-dev \
    python-setuptools \
    python-pip  \
    libjpeg-dev \
    libtiff-dev \
    zlib1g-dev \
    libfreetype6-dev \
    liblcms2-dev \
    libssl-dev \
    libncurses-dev \
    liblzma-dev \
    libgdbm-dev \
    libsqlite3-dev \
    libbz2-dev \
    tk-dev \
    libreadline6-dev \
    libffi-dev \
    nodejs

apt-get upgrade -y

easy_install pip
pip install pip --upgrade

pip install virtualenvwrapper

cp /vagrant/install/pg_hba.conf /etc/postgresql/$PGSQL_VERSION/main/
echo "listen_addresses = '*'" >> /etc/postgresql/$PGSQL_VERSION/main/postgres.conf
/etc/init.d/postgresql restart

su - postgres -c "createuser -s vagrant"

# bash environment global setup
cp -p /vagrant/install/bashrc /home/vagrant/.bashrc
cp -p /vagrant/install/inputrc /home/vagrant/.inputrc

npm install -g \
    grunt \
    gulp \
    bower

# Cleanup
apt-get clean

echo "Zeroing free space to improve compression."
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
