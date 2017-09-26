# .myconf

This repo contains all of my configuration files. Credit to [StreakyCoba](https://news.ycombinator.com/item?id=11071754)

## Set up from scratch:

    git init --bare $HOME/.myconf
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
    config config status.showUntrackedFiles no


where my ~/.myconf directory is a git bare repository. Then any file within the home folder can be versioned with normal commands like:


    config status
    config add .vimrc
    config commit -m "Add vimrc"
    config add .config/redshift.conf
    config commit -m "Add redshift config"
    config push


## Replicate on new machine
To replicate this home directory on a new machine using the following command:

    git clone --separate-git-dir=$HOME/.myconf git@github.com:jamiewarb/myconf $HOME

## Replicate with non-empty $HOME
If your $HOME is not empty, you should do the following instead, to a temporary directory

    git clone --separate-git-dir=$HOME/.myconf /path/to/repo $HOME/myconf-tmp
    cp ~/myconf-tmp/.gitmodules ~  # If you use Git submodules
    rm -r ~/myconf-tmp/
    alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

