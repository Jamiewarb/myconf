# .myconf

This repo contains all of my configuration files. Credit to [StreakyCoba](https://news.ycombinator.com/item?id=11071754)

## Set up from scratch:

    git init --bare $HOME/.myconf
    alias myconf='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
    myconf config status.showUntrackedFiles no


where my ~/.myconf directory is a git bare repository. Then any file within the home folder can be versioned with normal commands like:


    myconf status
    myconf add .ackrc
    myconf commit -m "Add ackrc"
    myconf add .zshrc
    myconf commit -m "Add zshrc"
    myconf push


## Replicate on new machine
To replicate this home directory on a new machine using the following command:

    git clone --separate-git-dir=$HOME/.myconf git@github.com:jamiewarb/myconf $HOME

## Replicate with non-empty $HOME
If your $HOME is not empty, you should do the following instead, to a temporary directory

    git clone --separate-git-dir=$HOME/.myconf /path/to/repo $HOME/myconf-tmp
    cp ~/myconf-tmp/.gitmodules ~  # If you use Git submodules
    rm -r ~/myconf-tmp/
    alias myconf='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

## Explanation
The first line creates a folder ~/.myconf which is a Git bare repository that will track our files.
Then we create an alias myconf which we will use instead of the regular git when we want to interact with our configuration repository.
We set a flag - local to the repository - to hide files we are not explicitly tracking yet. This is so that when you type myconf status and other commands later, files you are not interested in tracking will not show up as untracked.
