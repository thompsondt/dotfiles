# a default .bash_profile to link to in your home directory
if [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
fi

# !!!!!!!!!!!!!!!
# NOTE: System specific code should go in ~/.bash_profile_local
# !!!!!!!!!!!!!!!
if [[ -f ~/.bash_profile_local ]]; then
    # run system specific code if provided
    source ~/.bash_profile_local
fi
