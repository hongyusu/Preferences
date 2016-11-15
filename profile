# enable color support of ls and also add handy aliases
alias ls='ls -G'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias sshx='ssh -X'
alias du='du -h'
alias mate='/Applications/TextMate.app/Contents/Resources/mate'



# some more ls aliases
alias ll='ls -lhF'
alias la='ls -A'
alias lp='ls -p'
alias l='ls -CF'
alias lr='ls -R'
