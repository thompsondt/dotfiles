#!/bin/bash

function usage {
    echo "Controls display of desktop icons"
    echo "Usage: desktop {on|off}"
}

function desktop_on {
    defaults write com.apple.finder CreateDesktop true; killall Finder
}

function desktop_off {
    defaults write com.apple.finder CreateDesktop false; killall Finder
}

### INPUT HANDLING ############################################################

if [[ -z "${1}" ]]; then
    usage
    exit 1
fi

case "$1" in
    on)
        desktop_on;
        exit 1;
        ;;
    off)
        desktop_off;
        exit 1;
        ;;
    *)
        usage
        exit 4
        ;;
esac

exit 0
