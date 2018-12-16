# OpenCog packaging-related files for Debian / Ubuntu

This repository contains needed files for packaging the [OpenCog](https://github.com/opencog) AI testbed for Debian / Ubuntu based GNU/Linux distributions.

## Pre-built OpenCog packages for Debian sid

I periodically upload OpenCog packages to my personal Debian APT repository.  I build these packages on Debian sid, but you can use them on Debian testing or the recent Ubuntu releases (and of course you can quite easily rebuild it by yourself).

1. Put something like the following as /etc/apt/sources.list.d/opencog.list:

```
deb https://people.debian.org/~mhatta/debian mhatta-unstable/
deb-src https://people.debian.org/~mhatta/debian mhatta-unstable/
```
2. You need to add my GPG pubkey.

``
$ wget -q -O - https://people.debian.org/~mhatta/mhatta.asc | sudo apt-key add
`
`
3. Install packages.

``
$ sudo apt-get update; sudo apt-get install opencog
``

There are currently 5 packages: `opencog`, `opencog-atomspace`, 

## Building OpenCog by yourself

Build dependencies are carefully set, so what you need is:

1. Cloning each OpenCog repos in a directory

2. Copy `debian/` and `update-$REPO_NAME.sh` into that directory

3. Run `update-$REPO_NAME.sh` (this will copy `debian/` and give you the orig source tarball)

4. In the source directory, run 
