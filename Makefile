all: build

build:
	vagrant destroy
	vagrant up
	vagrant halt
	rm -f django-base.box
	vagrant package --output django-base.box

install:
	vagrant box add django-base django-base.box
