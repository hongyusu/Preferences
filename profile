# enable color support of ls and also add handy aliases
alias ls='ls -G'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias sshx='ssh -X'
alias du='du -h'
alias screen='/usr/local/bin/screen'
#alias mate='/Applications/TextMate.app/Contents/Resources/mate'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'





# some more ls aliases
alias ll='ls -lhF'
alias la='ls -A'
alias lp='ls -p'
alias l='ls -CF'
alias lr='ls -R'




# List Java versions installed
# /usr/libexec/java_home -V
#
# # Java 10
# export JAVA_HOME=$(/usr/libexec/java_home -v 10)
#
# # Java 9
# export JAVA_HOME=$(/usr/libexec/java_home -v 9)
#
# # Java 1.8
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
#
# # Java 1.7
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
#
# # Java 1.6
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.6)
