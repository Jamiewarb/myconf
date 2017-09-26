# If you come from bash you might have to change your $PATH.
export PATH="/bin"
export PATH="/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/Jamie/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ssh-add -K ~/.ssh/id_rsa

#--------------------------#
# ALIASSES - APPLICATIONS  #
#--------------------------#
#//------- Shell --------\\#
alias mkdir="mkdir -pv"
alias wget="wget -c"
alias histg="history | grep"
alias localip="ip addr show en0 | grep -inet\ | awk '{ print $3 }' | awk -F/ '{print $1}'"

#//----- Git & Hub ------\\#
alias git="hub"
alias gst="git status --short --branch"
alias gpu="git push"
alias gpl="git pull"
alias gch="git checkout"
alias gco="git commit"
alias gad="git add"
alias grm="git rm"
alias gmv="git mv"
alias gbr="git branch"
alias gmnff="git merge --no-ff"
alias gpr="git pull-request"

# Enable the ~/.myconf file to track files in my $HOME directory for VC
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

#//------- Hex ----------\\#
alias cdwp='cd wp-content/themes/$(basename "$PWD")'
alias cdbill='cd ~/Sites/bills/wp-content/themes/billstheme'

alias chout='sudo sh ~/Sites/tools/checkout.sh'
alias install-wp='sudo sh ~/Sites/tools/wordpress.sh'

alias gchs='git checkout staging'
alias gchp='git checkout production'
alias gchm='git checkout master'
alias gchd='git checkout development'

alias cdq=gotorepo

alias cdbot=gotobotrepo

alias subl=sublime
alias pbssh="pbcopy < ~/.ssh/id_rsa.pub"
alias tt-fetch="ssh root@komodo.hexdigital.com 'php /var/www/vhosts/tasktracker.komodo.hexdigital.com/artisan fetch'"
alias portal-fetch="ssh root@komodo.hexdigital.com 'php /var/www/vhosts/portal.komodo.hexdigital.com/current/artisan fetch'"
alias mcb-cache="ssh mcbhprod@python.hexdigital.com 'php /home/mcbhprod/current/scripts/clear-cache.php'"
alias bills-cache="ssh deploy@dragon.hexdigital.com 'php /var/www/bills-website.co.uk/wp-content/themes/billstheme/clear-menu-cache.php'"

alias snip="cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"

#--------------------------#
#  SHELL - LOOK AND FEEL   #
#--------------------------#
#  # Git branch for prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function get_date() {
  date +%H:%M:%S
}

function battery_charge {
    echo `$BAT_CHARGE` 2>/dev/null
}

setopt prompt_subst

# Set prompt, colours and ls colours
PROMPT='%{[35m%}$(get_date)$reset_color:%{[36m%}%n$reset_color@%{[32m%}%m$reset_color:%{[33;1m%}$(get_pwd)%{[32m%}$(parse_git_branch)
%{[m%}$ '
RPROMPT='$(battery_charge)'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""


# Style ls output, colour, file type, file size changes
alias ls='ls -GFh'
alias ll='ls -lah'

#--------------------------#
#    SHELL - FUNCTIONS     #
#--------------------------#

# create dir and move in to it
function mcd() {
    mkdir "$@" && cd "$@"
}

# Change working directory to a wordpress repo
function gotorepo() {
    cd ~/Sites/$1 && cdwp
}

# Change working directory to a bot repo
function gotobotrepo() {
    cd ~/Bots/$1
}

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
    cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# extract almost any time of archive file
function extract {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    else
        if [ -f $1 ] ; then
            # NAME=${1%.*}
            # mkdir $NAME && cd $NAME
            case $1 in
              *.tar.bz2)   tar xvjf ../$1    ;;
              *.tar.gz)    tar xvzf ../$1    ;;
              *.tar.xz)    tar xvJf ../$1    ;;
              *.lzma)      unlzma ../$1      ;;
              *.bz2)       bunzip2 ../$1     ;;
              *.rar)       unrar x -ad ../$1 ;;
              *.gz)        gunzip ../$1      ;;
              *.tar)       tar xvf ../$1     ;;
              *.tbz2)      tar xvjf ../$1    ;;
              *.tgz)       tar xvzf ../$1    ;;
              *.zip)       unzip ../$1       ;;
              *.Z)         uncompress ../$1  ;;
              *.7z)        7z x ../$1        ;;
              *.xz)        unxz ../$1        ;;
              *.exe)       cabextract ../$1  ;;
              *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
    fi
}

# git functions
function newb() {
  sh ~/bin/new-branch.sh $1 $2
}

echo 'ZSH Shell loaded successfully - ~/.zshrc'

export PATH="$HOME/.yarn/bin:$PATH"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
