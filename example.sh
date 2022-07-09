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
git submodule update --init --recursive
source "$(pwd)/lib-sh/lib.sh"
# config="$(pwd)/config/config.json"

# Functions
# ---------------------------------------------------\

_check() {

    echo -e "[${GREEN}✓${NC}] Example systemd units checking"
    space
    if service_exists "NetworkManager.service"; then
        Info "$ON_CHECK" "NetworkManager service already exists."
        chk_SvsStatus "NetworkManager.service"
    fi

    if service_exists "firewalld.service"; then
        Info "$ON_CHECK" "Firewall service already exists."
    else
        Info "$ON_CHECK" "Firewall service does mot exists."
    fi

    Splash
    echo -e "[${GREEN}✓${NC}] Example custom messages"
    space
    Info "$ON_CHECK" "Information messages / Notifications"
    Warn "WARN" "Warning messages / Notifications"
    Success "OK" "Success messages / Notifications"
    Error "FAIL" "Error messages / Notifications"

    Splash
    echo -e "[${GREEN}✓${NC}] Example checking folders and files exists"
    if file_exist "/etc"; then
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

    if [[ "$RPM" -eq "1" ]]; then
        Info "$ON_CHECK" "Example message: Run CentOS distro detected..."
        echo -e "[${GREEN}✓${NC}] Hello form lib-sh!"
        _check
    elif [[ "$RPM" -eq "2" ]]; then
        Info "$ON_CHECK" "Example message: Run Fedora distro detected..."
        echo -e "[${GREEN}✓${NC}] Hello form lib-sh!"
        _check
    elif [[ "$DEB" -eq "1" ]]; then
        Info "$ON_CHECK" "Example message: Debian-based distro detected..."
        echo -e "[${GREEN}✓${NC}] Hello form lib-sh!"
        _check
    else
        Info "$ON_FAIL" "Example message: Distro does not detected..."
        echo -e "[${RED}✓${NC}] Hello form lib-sh!"
        _exit
    fi
}

# Checks
# ---------------------------------------------------\
isRoot
checkDistro

init
