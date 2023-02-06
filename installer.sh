#!/usr/bin/env bash
#
# An interactive installation script written using dialog program. 
# This script is mainly for Arch Linux, but can be configured for 
# other distributions, e.g. Void Linux.
# 
# TODO: check if current distro is supported
# TODO: --config-only, just for ricing up, not for a full install

CURDIR="$(dirname "$0")"
INCDIR="${CURDIR}/include"

source "${INCDIR}/args.sh"

trap "die" SIGINT SIGQUIT SIGTSTP SIGTERM
