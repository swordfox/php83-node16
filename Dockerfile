FROM stayallive/php:8.3

# The base image ships Node 20 installed via `n`; swap it for the version we want.
ARG NODE_VERSION=16.20.2

RUN n "$NODE_VERSION" \
    && n prune \
    && node --version \
    && npm --version

# Build dependencies for imagemin binaries (pngquant, mozjpeg, gifsicle) that
# compile from source when their prebuilt binaries don't run.
RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libpng-dev \
        zlib1g-dev \
        pkg-config \
        build-essential \
        autoconf \
        automake \
        libtool \
        nasm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
