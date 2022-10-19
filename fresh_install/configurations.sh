#!/bin/bash
configure_zsh() {
    chsh -s $(which zsh)
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

configure_startup_apps(){
    cp /usr/share/application/discord.desktop ~/.config/autostart
    cp /usr/share/application/org.flameshot.Flameshot.desktop ~/.config/autostart
    cp /usr/share/application/steam.desktop ~/.config/autostart
}