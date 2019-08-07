#!/bin/bash
#
# @filename: install_sack.sh
#
# @author Sampson L. Chen (sampson-chen / slchen)
# @date 2012-10-14
#
# @description:
# Sack auto-install script
#
# @usage:
# run this script from where the git repo is cloned to.

# sack installation variables
sack__install_main=$HOME/bin
sack__install_sackrc=$HOME/.config/sack
sack__install_cwd=$(pwd)

# If the install directory doesn't exist, create it
if [[ ! -d "$sack__install_main" ]]; then
    echo "Creating '$sack__install_main'..."
    mkdir -p "$sack__install_main"
fi

echo "Linking 'sack' in '$sack__install_main/sack'..."
#cp "$sack__install_cwd/sack" "$sack__install_main"
ln -s "$sack__install_cwd/sack" ... "$sack__install_main"
#chmod +x "$sack__install_main/sack"

#echo "Copying 'sag' to '$sack__install_main/sag'..."
#cp "$sack__install_cwd/sag" "$sack__install_main"
#chmod +x "$sack__install_main/sag"

if [[ -f "$sack__install_sackrc/sackrc" ]]; then
    echo >&2
    echo "It seems you already have a sackrc from a previous install." >&2
    echo >&2
    echo "Overwrite this with a fresh copy from the source distribution" >&2
    echo "(losing your customizations)?" >&2
    echo >&2
    read -p "(Ctrl+C to quit) y/[N]? " ANS
    if [[ $ANS =~ ^[Yy] ]]; then
        echo
        echo "Overwriting your existing rcfile at '$sack__install_sackrc/sackrc'..."
        cp "$sack__install_cwd/sackrc" "$sack__install_sackrc"
    else
        echo
        echo "Okay, not overwriting your existing sackrc."
    fi
else
    echo "Creating new rcfile at '$sack__install_sackrc/sackrc'..."
    mkdir -p "$sack__install_sackrc"
    cp "$sack__install_cwd/sackrc" "$sack__install_sackrc"
fi

echo
echo "All done."
