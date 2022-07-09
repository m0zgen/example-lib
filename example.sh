#!/bin/bash
# Author: Yevgeniy Goncharov aka xck, http://sys-adm.in
# Example lib-sh using: https://github.com/m0zgen/lib-sh

# Envs
# ---------------------------------------------------\
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)
cd $SCRIPT_PATH

# Libs / Configs
# ---------------------------------------------------\
source "$(pwd)/lib-sh/lib.sh"
# config="$(pwd)/config/config.json"


# Checks
# ---------------------------------------------------\
isRoot