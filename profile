# enable color support of ls and also add handy aliases
alias his='history'
alias ls='ls -GF --color'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias sshx='ssh -X'
alias du='du -h'
alias en='screen -DR'


# some more ls aliases
alias ll='ls -lhF'
alias la='ls -A'
alias lp='ls -p'
alias l='ls -CF'
alias lr='ls -R'
alias print='~/scripts/print.sh'
alias en='screen -DR'
alias kepaco='cd /fs/project/kepaco/'
##

# Finished adapting your PATH environment variable for use with MacPorts.
export CLICOLOR=1
export DISPLAY=:0.0
