# Base images can be found here: https://hub.docker.com/_/ubuntu/
# Ubuntu 14.04 LTS (Trusty Tahr) is supported through 2019.
# Ubuntu 16.04 LTS (Xenial Xerus) has just been released and probably should
#   not be used yet (because dependent software may need to be updated and
#   made compatible).
#
FROM ubuntu:14.04.4
MAINTAINER Dave Hein <dave@example.com>

# To void the cache beyond the base image, change time string to current time
#
ENV APT_REFRESHED_AT 2016-05-26T00:39-0500

# Setting this environment variable prevents errors during package installs
# that look like:
#
# debconf: unable to initialize frontend: Dialog
# debconf: (TERM is not set, so the dialog frontend is not usable.)
# debconf: falling back to frontend: Readline
#
# As per: http://stackoverflow.com/a/35976127/1392864
#
ARG DEBIAN_FRONTEND=noninteractive

# Update apt package info and upgrade installed packages (base image
# has some packages installed)
#
RUN apt-get update && apt-get -y upgrade
