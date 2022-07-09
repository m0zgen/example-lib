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
# git submodule update --init --recursive
git submodule update --recursive --remote --init
source "$(pwd)/lib-sh/lib.sh"
# config="$(pwd)/config/config.json"

# Functions
# ---------------------------------------------------\

_check() {

    # space
    # echo -e "[${GREEN}✓${NC}] Example systemd units checking"

    # if chk_SvcExist "NetworkManager.service"; then
    #     Info "$ON_CHECK" "NetworkManager service already exists."
    #     chk_SvsStatus "NetworkManager.service"
    # fi

    # if service_exists "firewalld.service"; then
    #     Info "$ON_CHECK" "Firewall service already exists."
    # else
    #     Info "$ON_CHECK" "Firewall service does mot exists."
    # fi

    space
    echo -e "[${GREEN}✓${NC}] Example custom messages"
    space

    Info "$ON_CHECK" "Information messages / Notifications"
    Warn "$ON_CHECK" "Warning messages / Notifications"
    Success "$ON_CHECK" "Success messages / Notifications"
    Error "$ON_CHECK" "Error messages / Notifications"

    space
    echo -e "[${GREEN}✓${NC}] Example checking folders and files exists"
    space

    if dir_exist "/etc"; then
        Info "$ON_CHECK" "/etc catalog already exists."
    fi

    if file_exist "/etc/hosts"; then
        Info "$ON_CHECK" "/etc/hosts file already exists."
    fi

    if dir_or_file_exist "/etc/init"; then
        Info "$ON_CHECK" "/etc/init file already exists."
    fi

}

init() {

    space
    if [[ "$RPM" -eq "1" ]]; then
        echo -e "[${GREEN}✓${NC}] Hello form lib-sh!"
        Info "$ON_CHECK" "Example message: Run CentOS distro detected..."
        _check
    elif [[ "$RPM" -eq "2" ]]; then
        echo -e "[${GREEN}✓${NC}] Hello form lib-sh!"
        Info "$ON_CHECK" "Example message: Run Fedora distro detected..."
        _check
    elif [[ "$DEB" -eq "1" ]]; then
        echo -e "[${GREEN}✓${NC}] Hello form lib-sh!"
        Info "$ON_CHECK" "Example message: Debian-based distro detected..."
        _check
    elif [[ "$OS" -eq "osx" ]]; then
        echo -e "[${GREEN}✓${NC}] Hello form lib-sh!"
        Info "$ON_CHECK" "Example message: macOS detected..."
        _check
    else
        echo -e "[${RED}✓${NC}] Hello form lib-sh!"
        Info "$ON_FAIL" "Distro does not detected..."
        _exit
    fi
}

# Checks
# ---------------------------------------------------\
# isRoot

get_distro
checkDistro

init




