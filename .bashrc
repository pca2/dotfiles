source /etc/profile
export EDITOR=/usr/bin/vim
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias zgrep='zgrep --color=auto'
fi


# some more ls aliases
alias ll='ls -lhrt'
alias la='ls -A'
alias l='ls -CF'


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
#Commenting out the prompt colors
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\e[0;44m\]\[\e[1;37m\]\u@\h:\w\$\[\e[m\]\[\e[m\] '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

PS1="\u@\h:\w$ "


#"$color_prompt" = yes 

#color
#if [ "$color_prompt" = yes ]; then
#   PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#   PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi


#Custom Aliases


alias install="sudo apt-get install"
alias upd="sudo apt-get update"
alias updg="sudo apt-get update || sudo apt-get upgrade"
alias upg="sudo apt-get upgrade"
alias addppa="sudo add-apt-repository" 
alias autoclean="sudo apt-get autoclean"
alias autoremove="sudo apt-get autoremove"
alias clean="sudo apt-get clean"
alias vim="vim -N"


#grep that history!
hgrep(){
    history | grep ${1}
}

#grep that ps 
psgrep() {
ps -ef | grep ${1}
}


#Who can remember how to untar
alias untar='tar -zxvf' 
#load standard lib for bc
alias bc='bc -l'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export HISTTIMEFORMAT="%F %T "
#Make solarized vim play nice with tmux
alias tmux="TERM=screen-256color-bce tmux"
alias open=gnome-open
