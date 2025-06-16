
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# =========================================
# Run any platform specific commands first
# =========================================


# OSX/Darwin
# ----------
if [[ "$(uname)" == "Darwin" ]]; then
    echo "Setting up for Mac/Darwin"

    # Setup GNU Coreutil compatability when on the mac
    # ------------------------------------------------

    # When installing gnu coreutils to the mac the commands have been prefixed with
    # a 'g', so to use these commands with their normal names we must add a
    # "gnubin" directory to our PATH from bashrc.
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

    # Search local user binaries first when executing commands rather than
    # defaulting directly to system-provided binaries 
    export PATH="/usr/local/bin:$PATH"

    # To access the man pages with the normal names for the GNU coreutils commands
    # you must add the "gnuman" directory to your MANPATH from bashrc.
    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"


# Linux Systems
# -------------
elif [[ "$(uname)" == "Linux" ]]; then
    export EDITOR=vim
    echo "Setting up for Linux"

# Handle unknown systems
# ----------------------
else
    echo "Unable to identify system UNAME: $(uname)"
    exit 1

fi



# =========================================
# Run commands that apply to all platforms
# ========================================= 


# Setup Terminal Colors
# ---------------------

# TODO: See if we can make the following variables local rather than having them
# in the global context

# Below is what controls the color of the PS1 (after installing GNU coreutils)
NORM_CLR="\[\033[0;37m\]"
HOST_CLR="\[\033[0;37m\]"
DIR_CLR="\[\033[0;36m\]"
COMM_CLR="\[\033[0;31m\]"

OPERATING_ENV="DEVELOPMENT" # OR "TESTING" OR "PRODUCTION"

if [[ $OPERATING_ENV == "PRODUCTION" ]]; then
    # Set PS1 host and username to red
    HOST_CLR="\[\033[0;31m\]"
fi


export PS1="$HOST_CLR\u@\h$NORM_CLR:$DIR_CLR\W$NORM_CLR\$ "

# Enable color support for LS and some useful aliases
# NOTE: This requires the GNU "coreutils" package which is available from brew
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='-a --color=auto'
    eval `dircolors ~/.dircolors`
    alias ls='ls $LS_OPTIONS'
fi

# FZF - A "Fuzzy Finder" for Command Line
# ---------------------------------------
# https://github.com/junegunn/fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add user bin folder to command search path
# ------------------------------------------
echo Adding user 'bin' folder to search path
export PATH=$PATH:$HOME/bin
