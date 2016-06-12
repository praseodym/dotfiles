# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/zsh/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mark"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="${SSH_TTY:+true}"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

zstyle ':completion:*' completer _complete _match _approximate

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(gitfast osx brew gradle mercurial rvm extract mvn rsync textmate sublime autojump virtualenvwrapper)
plugins=(gitfast debian gradle mercurial rvm extract mvn rsync autojump)

source $ZSH/oh-my-zsh.sh
if [[ -o LOGIN ]]; then
	stty erase \^\H
	stty erase '^?'
	bindkey "^[[3~" delete-char
fi

if [[ $(uname) = 'Linux' ]]; then
	export EDITOR='vim'
	# alias ls='ls --color=auto'
	apt-upgrade() { apt-get update && apt-get upgrade }
	alias ifconfig="/sbin/ifconfig"
	alias ack="ack-grep"
elif [[ $(uname) = 'Darwin' ]]; then
	export EDITOR='mate -w'

	alias dmesg="sudo dmesg"
	alias oc='open -a Console.app'
	alias fsu='sudo fs_usage -e -f filesystem | grep -v -e CACHE_HIT -e Terminal -e grep'
	alias dns='dscacheutil -q host -a name'

	alias lcl='launchctl list'
	alias lcs='launchctl start'

	alias spwd='pwd | pbcopy'

	alias mdfields='mdimport -X'

	alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
	alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

	alias jsc='/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc'

	alias -g S='| subl'
	alias -g M='| mate'

	java6() { export JAVA_HOME=`/usr/libexec/java_home -v1.6`; export PATH=$JAVA_HOME/bin:$PATH }
	java7() { export JAVA_HOME=`/usr/libexec/java_home -v1.7`; export PATH=$JAVA_HOME/bin:$PATH }
	java8() { export JAVA_HOME=`/usr/libexec/java_home -v1.8`; export PATH=$JAVA_HOME/bin:$PATH }
	java9() { export JAVA_HOME=`/usr/libexec/java_home -v9`; export PATH=$JAVA_HOME/bin:$PATH }

	similde() { ssh similde -t HOME=/home/group01/mark bash }

	alias sqlmap='~/git/sqlmap/sqlmap.py'
fi

# Irc() { print -Pn "\e]2;irc\a"; ssh -t Ir screen -D -r irc}
update-dotfiles() { pushd ~/.dotfiles && git pull && ./install.sh && popd }
sshr() { print -Pn "\e]0;root@$1\a"; ssh -t root@$1 HOME='~mark' zsh }
sshra() { print -Pn "\e]0;root@$1\a"; ssh -At root@$1 HOME='~mark' zsh }
alias pg='su -s /bin/zsh postgres'
alias rscp='rsync -avzP --exclude=.DS_Store'
alias host6='host -6'
alias ll='ls -al'
alias gh='fc -l 0 | grep'
alias alg='alias | grep -i'
alias dsrm="find . -type f -name .DS_Store -print0 | xargs -0 rm"
alias nsop='netstat -tunl -p tcp'
alias mq='hg -R $(hg root)/.hg/patches'
alias sl=ls
alias sshnew="ssh -S none"
alias lsoftcp="sudo lsof -iTCP -sTCP:LISTEN -n -P"

alias zsu='su -p'
alias zsudo='sudo -E -s'
alias s_http='python -m SimpleHTTPServer'

alias -g L='| less'
alias -g G='| grep'
alias -g GV='| grep -v'
alias -g GE='| egrep'
alias -g XG="| xargs grep -ni"

alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'

concathist() { cat ~/.histfile* >> $HISTFILE && rm ~/.histfile* }

# HISTFILE=$HOME/.histfile-$USER

[ -s ~/.travis/travis.sh ] && . ~/.travis/travis.sh
