#!/bin/bash

# The "Tag List" plugin is a source code browser plugin for Vim and
# provides an overview of the structure of source code files and allows
# you to efficiently browse through source code files for different
# programming languages.  You can visit the taglist plugin home page for
# more information:

#      http://vim-taglist.sourceforge.net 


# =========================================
# Process feature flags
# =========================================

EXPERIMENTAL_USE_ANSIBLE_WIP=${EXPERIMENTAL_USE_ANSIBLE_WIP:-false}
if [[ "$EXPERIMENTAL_USE_ANSIBLE_WIP" == "true" ]]; then
    echo "Using experimental Ansible WIP setup"
    uv run -- ansible-playbook playbook.yml
    echo "Error: implementation is not complete"
    exit 1
fi

FEATURE_LEGACY_SETUP_DISABLED=${FEATURE_LEGACY_SETUP_DISABLED:-true}
if [[ "$FEATURE_LEGACY_SETUP_DISABLED" == "true" ]]; then
    echo "Legacy setup is disabled by default during project cleanup"
    echo "Enable with FEATURE_LEGACY_SETUP_DISABLED=false setup.sh"
    exit 0
fi


# =========================================
# Run any platform specific commands first 
# =========================================


# OSX/Darwin
# ----------
if [[ "$(uname)" == "Darwin" ]]; then
    # Run the setup code specific to OSX
    echo "Setting up for Apple OSX"

    read -p "Have you installed XCode and XCode Command Line Tools? " -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
            exit 1
    fi

    # Need to install homebrew for use with OSX
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install )"

    # run brew doctor - before "installing" anything with brew
    brew doctor

    read -p "Happy with Brew Doctor Output? " -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
            exit 1
    fi

    # python may be needed for pip
    brew install python

    # Install required software for the vim taglist plugin
    brew install ctags-exuberant

    # Install GNU Coreutils so that we have better control over commands like
    # ls and the ability to specifcy a universal terminal color file
    brew install coreutils

    # Try to install a newer version of vim... Currently working on 7.4
    brew install vim


# Linux Systems
# -------------
elif [[ "$(uname)" == "Linux" ]]; then
    # Run the setup code specific to Linux
    echo "Setting up for Linux"

    echo "Installing the python package installer"
    sudo apt-get install python-pip

    echo "Installing prerequisites for vim's Taglist plugin"
    sudo apt-get install exuberant-ctags


# Handle unknown systems
# ----------------------
else
    echo "Unable to identify system UNAME: $(uname)"
    exit 1

fi



# =========================================
# Run commands that apply to all platforms
# ========================================= 