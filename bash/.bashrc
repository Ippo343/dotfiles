# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export HISTFILESIZE=20000
export HISTSIZE=20000

export LANG=en_US.UTF-8
export PATH=$PATH:/sdev/bin
export PATH=$PATH:/home/$(whoami)/.local/bin
export PATH="`echo "$PATH" |/bin/awk 'BEGIN{RS=":";}{sub(sprintf("%c$",10),"");if(A[$0]){}else{A[$0]=1;printf(((NR==1)?"":":")$0)}}'`";

# User specific aliases and functions

ALIASES="/home/$(whoami)/.bash_aliases"
if [ -f "$ALIASES" ]; then
    source "$ALIASES"
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

if [ "$JAVA_HOME" = "" ]; then
    LATEST="/home/$(whoami)/java/latest"
    if [ -d "$LATEST" ]; then
        export JAVA_HOME="$LATEST"
    fi
fi

export WIN_C="/home/$(whoami)/ctxmnt/C"
export WIN_HOME="$WIN_C/Users/$(whoami)"
export WIN_DESK="$WIN_HOME/Desktop"

