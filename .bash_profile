
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# keep .bash_history updated after every command
PROMPT_COMMAND='history -a; history -n'


# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# put timestamps in the history
HISTTIMEFORMAT='%F %T '


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


alias autoremove="sudo apt-get autoremove"
alias autoclean="sudo apt-get autoclean"
alias clean="sudo apt-get clean"
alias upd="sudo apt-get update"
alias upg="sudo apt-get upgrade"
alias updg="sudo apt-get update && sudo apt-get -y upgrade"
alias addppa="sudo add-apt-repository" 
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias sources="sudo gedit /etc/apt/sources.list"
alias addppa="sudo add-apt-repository"
alias cleanremove="sudo apt-get autoremove && sudo apt-get autoclean && sudo apt-get clean"
alias epistle="cd ~/Dropbox/epistle"
alias vlcl="vlc -I ncurses --browse-dir /media/MEDIA/Music"
alias spi='ssh pi@192.168.1.12'
alias pimc='ssh pi@192.168.1.2'
alias dbox="cd /Users/carleton/Dropbox" 
alias pisynct="rsync -ruvhzn --size-only --progress --exclude-from '/media/MEDIA/Dropbox/Scripts/exclude.txt'  -e ssh pi@192.168.1.12:/media/Hub/videos/ /media/MEDIA/videos"
alias pisync="rsync -ruvhz --size-only --progress --exclude-from '/media/MEDIA/Dropbox/Scripts/exclude.txt'  -e ssh pi@192.168.1.12:/media/Hub/videos/ /media/MEDIA/videos"
alias pih="ssh -t pi@192.168.1.12 sudo halt"
alias ll="ls -lhrt"
alias rd="ruby ~/Git/ruby-todo/todo.rb"
alias fcast="ruby ~/forecast.rb"
alias batwing="ssh carleton@45.55.135.243 -p 6879"

alias bc='bc -l'

#Open new txt in epistle folder with given slug - "n newfile" opens newfile.txt
n()  {
 vim -c 'startinsert' ~/Dropbox/epistle/${1}.txt
}

#List files in epistle greping for the given slug
nls() {
	ls -rt ~/Dropbox/epistle/ | grep -i ${1}
}

hgrep() {
    history | grep ${1}
}
#postgres service
alias pg_service='pg_ctl -D /usr/local/var/postgres'



export EDITOR=vim

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
#Make solarized vim play nice with tmux
#alias tmux="TERM=screen-256color-bce tmux"
alias tmux="tmux -2"
copy(){
  cat $1 | pbcopy
}
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
#rbenv
eval "$(rbenv init -)"
