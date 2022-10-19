#!/bin/bash
update_all() {
    echo "Updating and upgrading your system"
    apt-get update && apt-get upgrade -y
}

add_gpg_keys_and_repositories() {

    mkdir -p /etc/apt/keyrings

    echo "Adding the gpg keys"
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo "Installing gpg packages"
    install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

    echo "Adding repositories"
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"/etc/apt/sources.list.d/google.list'
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    echo  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    add-apt-repository multiverse
    echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" | sudo tee -a /etc/apt/sources.list.d/insomnia.list
    apt-add-repository ppa:remmina-ppa-team/remmina-next

    echo "Removing gpg packages"
    rm -f packages.microsoft.gpg
}

install_packages() {
    update_all
    echo "Installing packages"
    apt-get -y install \
    audacity \
    google-chrome-stable \
    chrome-gnome-shell \
    apt-transport-https \
    code \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin \
    flameshot \
    git \
    obs-studio \
    obs-plugins \
    virtualbox \
    vlc \
    steam \
    insomnia \
    gnome-tweaks \
    gnome-shell-extensions \
    gparted \
    remmina \
    remmina-plugin-rdp \
    remmina-plugin-secret \
    wine \
    zsh \
    snapd

    echo "Installing through snap"
    snap install \
    discord \
    whatsdesk \
    spotify
}