# OpenCog packaging-related files for Debian / Ubuntu

This repository contains files for packaging the [OpenCog](https://github.com/opencog) AI/AGI testbed for Debian / Ubuntu based GNU/Linux distributions.  For general information on OpenCog, visit or 

## Pre-built OpenCog packages for Debian sid

I periodically upload pre-built OpenCog packages to my personal Debian APT repository.  I usually build these packages on Debian sid (unstable), but you can use them on Debian Buster (testing) or the recent Ubuntu releases.  And of course, you can quite easily rebuild them by yourself.

### How to apt-get opencog

1. Put something like the following as /etc/apt/sources.list.d/opencog.list:

```
deb https://people.debian.org/~mhatta/debian mhatta-unstable/
deb-src https://people.debian.org/~mhatta/debian mhatta-unstable/
```
2. You need to add my GPG pubkey.

``
$ wget -q -O - https://people.debian.org/~mhatta/mhatta.asc | sudo apt-key add
``

3. Install packages.

``
$ sudo apt-get update; sudo apt-get install opencog
``

There are currently 5 packages available: `opencog`, `opencog-cogutils`, `opencog-atomspace`, `opencog-moses`, `opencog-relex`.  `opencog` depends on the others, so `apt-get install opencog` should be enough.  `apt-get source`,`apt-get build-dep`, etc. should also work.

`jwnl`(Java WordNet Library) is not a part of OpenCog, but it is available in this APT repository since `opencog-relex` uses it and not available in the main Debian archive.  `link-grammar` is [avavilable in the main Debian archive](https://tracker.debian.org/pkg/link-grammar) but sadly has been orphaned and has no Debian maintainer currently.

Also, you can access the APT repository directly: https://people.debian.org/~mhatta/debian/mhatta-unstable/. You can download older packages from there by hand.

## Building OpenCog by yourself

1. Cloning each OpenCog GitHub repos.

2. Copy `debian/` and `update-$REPO_NAME.sh` into that directory

3. Run `update-$REPO_NAME.sh` (this will give you the orig source tarball and copy `debian/` into the source dir)

4. Install needed packages for build by `apt-get build-dep $REPO_NAME`.  Change `debian/changelog`.

5. In the source dir, run `$ dpkg-buildpackage -rfakeroot`

