alias foldersize='du -h --summarize'

# Various ls aliases
alias ls='ls -F --color=auto'
alias l='ls -F'
alias ll='ls -lhF'
alias la='ls -AF'
alias lla='ls -lhAF'
alias lll='ls -lhAF --color=always | less -RF'
alias ltree='tree -C | less -RF'

alias pspy='ps aux | grep py'


# I cannot into typing
alias cd..='cd ..'

function cdl {
    cd $1 && clear && ll
}

alias s='(git status &>/dev/null && git status) || (svn status &> /dev/null && svn status)'

# Git aliases
alias d='git diff'
alias ds='git diff --staged'
alias good='git bisect good'
alias bad='git bisect bad'
alias fuck='git commit --amend'
alias cdg='cd $(git rev-parse --show-toplevel)'
alias gl='git log --stat'
alias pruneall='git remote | xargs git remote prune'
alias fetchall='git fetch --all --prune'
alias fixconflicts='vim +0 +/HEAD $(git diff --name-only | sort | uniq)'

function lines_by_author {
    git ls-files -z "$@" | xargs -0 -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr ;
}


# Finds all the files with the given extension
function findext {
    ext="$1"
    shift
    find . -type f -iname "*.$ext" "$@"
}

TIME_EXC='/usr/bin/time'
if [ -f "$TIME_EXC" ]; then
    alias time="$TIME_EXC -v"
fi

alias unset_proxies='export http_proxy=""; export https_proxy=""'

