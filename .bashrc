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

#todo.txt
#PATH=$PATH:"/net/home/carleton.atwater/todo.txt_cli-2.9/"
PATH=$PATH:"/net/home/carleton.atwater/chromedriver/"
export TODOTXT_DEFAULT_ACTION=ls
alias t='todo.sh -d /net/home/carleton.atwater/todo.txt_cli-2.9/todo.cfg'
alias ta='todo.sh -d /net/home/carleton.atwater/todo.txt_cli-2.9/todo.cfg -t add'

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


#alias sdb="sudo ~/.dropbox-dist/dropboxd &"
alias install="sudo apt-get install"
alias sources="sudo gedit /etc/apt/sources.list"
#alias trecent="twidge lsrecent"
#alias treplies="twidge lsreplies"
#alias tweet="twidge update"
alias upd="sudo apt-get update"
alias updg="sudo apt-get update || sudo apt-get upgrade"
alias upg="sudo apt-get upgrade"
#alias sd35="sudo shutdown -P +35"
alias addppa="sudo add-apt-repository" 
alias autoclean="sudo apt-get autoclean"
alias autoremove="sudo apt-get autoremove"
alias clean="sudo apt-get clean"
alias vim="vim -N"
alias vncv="vncviewer localhost"
alias vecna="cd ~/Files/Vecna"
alias mirthinfo="cat ~/Files/Vecna/NMH/mirthinfo.txt"
alias 25char="cat ~/Files/Vecna/25char.txt"
alias spt="cd ~/Git/Support/"
alias snotes="vim ~/Files/Vecna/Scriptnotes.txt" 
#most recent file in pwd
#alias mrf= $(ls -t | head -n1)
alias ppsql='psql -U ruby -h localhost -d'
alias wr="cd ~/Files/Vecna/WarRoom/"
#war room vm
alias wrvm="ssh -t 172.16.33.108 'source .bashrc; /bin/bash'"
#ruby todo!
alias rd='ruby ~/ruby-todo/todo.rb'

#stolen from DTAB
vnct() {
  ssh -t -L 5900:localhost:59005 vecnaadmin@152.132.52.83 "ssh -L 59005:localhost:5900 -t vkioskuser@${1} \"x11vnc -localhost -display :0 -scale 3/4; /bin/bash\""
}

#nmhvnc
vncn() {
  ssh -t -L 5900:localhost:59005 carleton.atwater@10.10.100.30 "ssh -L 59005:localhost:5900 -t vkioskuser@${1} \"x11vnc -localhost -display :0 -scale 3/4; /bin/bash\""
}
nws() {
  ssh -t -L 5900:localhost:59005 carleton.atwater@10.10.100.30 "ssh -L 59005:localhost:5900 -t vkioskuser@${1}; /bin/bash"
}



#grep that history!
hgrep(){
    history | grep ${1}
}

#grep that ps aux! - Using Autokey so it'll work on servers
#psgrep() {
#ps aux | grep ${1}
#}


#Who can remember how to untar
alias untar='tar -zxvf' 

#load standard lib for bc
alias bc='bc -l'

#nmh log capture
nmhlog(){
  mkdir -p /tmp/logs_`date +%m-%d`
  scp 10.10.100.30:/opt/tomcat/logs/${1} /tmp/logs_`date +%m-%d`/${1}
  echo ""
  echo ""
  echo "${1} copied to /tmp/logs_`date +%m-%d` on $HOSTNAME"
}

export EDITOR=/usr/bin/vim
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias fcast='ruby ~/forecast.rb'
source /etc/profile
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=' -R '
alias swr='ssh wr.agent@warroom'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export HISTTIMEFORMAT="%F %T "
#Make solarized vim play nice with tmux
alias tmux="TERM=screen-256color-bce tmux"
alias open=gnome-open
alias cutman="ssh wr.agent@172.16.35.221"
