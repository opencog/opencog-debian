FROM debian:sid
RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils gnupg curl ca-certificates \
    && export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 \
    && curl -sS https://people.debian.org/~mhatta/mhatta.asc | apt-key add - \
    && echo "deb http://people.debian.org/~mhatta/debian mhatta-unstable/" > /etc/apt/sources.list.d/opencog.list \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
       	       opencog jupyter-notebook guile-jupyter-kernel \
    && apt -y clean \
    && rm -rf /var/lib/apt/lists/*
