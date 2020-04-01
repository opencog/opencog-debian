# OpenCog packaging-related files for Debian / Ubuntu

This repository contains files for packaging the [OpenCog](https://github.com/opencog) AI/AGI testbed for Debian / Ubuntu based GNU/Linux distributions.  For general information on OpenCog, visit [the official website](https://opencog.org/) or [the offcial Wiki](https://wiki.opencog.org/w/The_Open_Cognition_Project).

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-refresh-toc -->
**Table of Contents**

- [OpenCog packaging-related files for Debian / Ubuntu](#opencog-packaging-related-files-for-debian--ubuntu)
    - [Pre-built OpenCog packages for Debian sid](#pre-built-opencog-packages-for-debian-sid)
        - [How to apt-get opencog](#how-to-apt-get-opencog)
    - [Docker image](#docker-image)
    - [Building OpenCog by yourself using these files](#building-opencog-by-yourself-using-these-files)
    - [License](#license)

<!-- markdown-toc end -->

## Pre-built OpenCog packages for Debian sid

I periodically upload pre-built OpenCog packages to my personal Debian APT repository.  I usually build these packages on Debian sid (unstable), but you can use them on Debian Bullseye (testing) or the recent Ubuntu releases.  And of course, you can quite easily rebuild them by yourself.

### How to apt-get opencog

1. Put something like the following as /etc/apt/sources.list.d/opencog.list:

```
deb https://people.debian.org/~mhatta/debian mhatta-unstable/
deb-src https://people.debian.org/~mhatta/debian mhatta-unstable/
```

Or, you can download [opencog.list](https://people.debian.org/~mhatta/opencog.list) from here.

2. You need to add my GPG pubkey.

``
$ wget -q -O - https://people.debian.org/~mhatta/mhatta.asc | sudo apt-key add
``

3. Install packages.

``
$ sudo apt-get update; sudo apt-get install opencog
``

There are currently 9 packages available: `opencog`, `opencog-cogutil`, `opencog-atomspace`, `opencog-moses`, `opencog-asmoses`, `opencog-relex`, `opencog-miner`, `opencog-cogserver`, `opencog-ure`, `opencog-visualization`. `opencog` depends on the others, so `apt-get install opencog` should be enough.  `apt-get source`,`apt-get build-dep`, etc. should also work.

`jwnl`(Java WordNet Library) is not a part of OpenCog, but is available in this APT repository since `opencog-relex` uses it and not available in the main Debian archive.  `link-grammar` is [avavilable in the main Debian archive](https://tracker.debian.org/pkg/link-grammar) but sadly has been orphaned and has no Debian maintainer currently.

Also, you can access the APT repository directly: https://people.debian.org/~mhatta/debian/mhatta-unstable/. You can download older packages from there by hand.

## Docker image

Debian-based Docker container image is [available](https://hub.docker.com/r/mhatta/opencog-be) at dockerhub.

## Building OpenCog by yourself using these files

1. Clone this repo into a directory.

2. Create directories, then clone each OpenCog GitHub repo into those dirs.

3. Copy `update-$REPO_NAME.sh` into each directory.

So the directory structure will look like the following:

```
.
├── asmoses
│   ├── asmoses (repo)
│   └── update-asmoses.sh
├── atomspace
│   ├── atomspace (repo)
│   └── update-atomspace.sh
├── cogserver
│   ├── cogserver (repo)
│   └── update-cogserver.sh
├── cogutils
│   ├── cogutils (repo)
│   └── update-cogutils.sh
├── miner
│   ├── miner (repo)
│   └── update-miner.sh
├── moses
│   ├── moses (repo)
│   └── update-moses.sh
├── opencog
│   ├── opencog (repo)
│   └── update-opencog.sh
├── opencog-debian (repo)
│   ├── README.md
│   ├── atomspace
│   ├── cogutils
│   ├── miner
│   ├── moses
│   ├── opencog
│   └── relex
│   └── ure
├── relex
│   ├── relex (repo)
│   └── update-relex.sh
├── ure
│   ├── ure (repo)
│   └── update-ure.sh
├── visualization
    ├── visualization (repo)
    └── update-visualization.sh
```

4. Run `update-$REPO_NAME.sh`.  This will create the source dir and the orig source tarball, then copy `debian/` into the source dir from `opencog-debian`.

5. Install needed packages for the build by `sudo apt-get build-dep $PACKAGE_NAME`.  Edit `debian/changelog`.

6. In the source dir, run `$ dpkg-buildpackage -rfakeroot`

## License

Files in this repo are put in Public Domain.
