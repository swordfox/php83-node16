FROM stayallive/php:8.3

# The base image ships Node 20 installed via `n`; swap it for the version we want.
ARG NODE_VERSION=16.20.2

RUN n "$NODE_VERSION" \
    && n prune \
    && node --version \
    && npm --version
