GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREAM=true
GIT_PS1_SHOWCOLORHINTS=true
source /usr/share/git-core/contrib/completion/git-prompt.sh
export PROMPT_COMMAND='__git_ps1 "\[\033[1;36m\]\u@\h\[\e[00m\] \[\e[1;34m\]\w\[\e[00m\]" " \$ "'
# XDebug
export XDEBUG_CONFIG="idekey=DBGP"
export XDEBUG_SESSION_START=DBGP


#ユニットテスト用の環境設定
export SIMFRAME_ENVIRONMENT=development_${USER}

# anyenv
if [ -d ${HOME}/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  for D in `ls $HOME/.anyenv/envs`
    do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

# User specific aliases and functions
alias ls='ls --color=always'
alias ps='ps --sort=start_time'
alias grep='grep --color=always'
alias http500="awk '{ if ( \$10 ~ /^50[0-9]\$/ ){print \$0}}'"
alias gitproxy='git config --global http.proxy 172.20.253.21:8080 ; git config --global https.proxy 172.20.253.21:8080'

PDSH_SSH_ARGS_APPEND="-q -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o PreferredAuthentications=publickey"

# screen
AGENT="$HOME/.ssh-agent-$(hostname)"
if [ -S "$AGENT" ]; then
  export SSH_AUTH_SOCK=$AGENT
elif [ ! -S "$SSH_AUTH_SOCK" ]; then
  export SSH_AUTH_SOCK=$AGENT
elif [ ! -L "$SSH_AUTH_SOCK" ]; then
  ln -snf "$SSH_AUTH_SOCK" $AGENT && export SSH_AUTH_SOCK=$AGENT
fi
