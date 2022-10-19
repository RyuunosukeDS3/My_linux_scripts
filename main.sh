#!/bin/bash
#. ./fresh_install/install_softwares.sh
. ./fresh_install/configurations.sh
configure_fresh_install(){
    update_all
    add_gpg_keys_and_repositories
    install_packages

    configure_zsh
    configure_startup_apps
}

configure_fresh_install