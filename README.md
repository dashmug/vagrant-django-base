vagrant-django-base
===================

This is my fork of `torchbox/django`. I personally use this as a base box for projects where I need to collaborate with another developer.

Build instructions
------------------
To generate the `django-base.box` file:

    make

This generated `django-base.box` file can be easily copied to other computers. This will save a lot of time instead of building the box from scratch.

To install on a machine:

    make install

See `Makefile` to see what commands are run in those above commands.
