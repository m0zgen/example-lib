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

# Functions
# ---------------------------------------------------\

init() {

    if [[ "$RPM" -eq "1" ]]; then
        Info "$ON_CHECK" "Run CentOS installer..."
        echo -e "[${GREEN}✓${NC}] Install CentOS packages"
    fi

    if [[ "$RPM" -eq "2" ]]; then
        Info "$ON_CHECK" "Run Fedora installer..."
        echo -e "[${GREEN}✓${NC}] Install Fedora packages"
    fi

    if [[ "$DEB" -eq "1" ]]; then
        Info "$ON_CHECK" "Run Debian installer..."
        echo -e "[${GREEN}✓${NC}] Install Debian packages"
    fi
}

# Checks
# ---------------------------------------------------\
isRoot
checkDistro

init
