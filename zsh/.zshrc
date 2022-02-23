# ~/.zshrv Interactive (non-)login

# Source Prezto
source "${HOME}/dotfiles/prezto/init.zsh"

# key mappings
bindkey "^[^[[C"  forward-word              # alt + right
bindkey "^[^[[D"  backward-word             # alt + left
bindkey "^[^[[A"  _history-complete-older   # alt + up
bindkey "^[^[[B"  _history-complete-newer   # alt + down

#
# Aliases
#

# std adjustments
alias ls="ls --color=auto"
alias -g L="|less"

# modent app improvements
alias ll="exa -l"
alias lla="exa -la"
alias curll=curlie
alias pss=procs
alias catt=bat
alias duu=dust
alias findd=fd

# pass
alias p="gopass show"
alias pc="gopass show -c"
alias pf="gopass show -f"
alias pass=gopass

# git
alias g=git
# fetch
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfm='git pull'
# working copy
alias gws='git status --ignore-submodules=$_git_status_ignore_submodules --short'
alias gwd='git diff --no-ext-diff'
alias gwdc='git diff --no-ext-diff --cached'
alias gwds='git difftool --no-symlinks --dir-diff'
alias gwdsc='git difftool --no-symlinks --dir-diff --cached'
# log
alias gl='git log --topo-order --pretty=format:"$_git_log_medium_format"'
alias gll='git log --graph --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --decorate'
alias gls='git log --topo-order --stat --pretty=format:"$_git_log_medium_format"'
alias gld='git log --topo-order --stat --patch --full-diff --pretty=format:"$_git_log_medium_format"'
# push
alias gp='git push'
alias gpc='git push --set-upstream origin "$(git-branch-current 2> /dev/null)"'
# commit
alias gc='git commit --verbose'
alias gcm='git commit --message'
# branch
alias gb='git branch'
alias gbc='git checkout -b'
# checkout
alias gco='git checkout'

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  ~/dotfiles/bin
  $path
)

# Enable homebrew paths in macOS
if [[ "$OSTYPE" == darwin* ]]; then
  if which brew >/dev/null 2>&1; then
    eval "$(brew shellenv)"
  elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
  elif [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

# kitty special
if which kitty >/dev/null 2>&1; then
  alias d="kitty +kitten diff"
  alias ssh="kitty +kitten ssh"
  alias icat="kitty +kitten icat"
fi

# awsume autocomplete path
if which awsume >/dev/null 2>&1; then
  fpath=(~/.awsume/zsh-autocomplete/ $fpath)
  alias awsume="source awsume"
fi

# enable autocomplete
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

# gopass autocomplete
if which gopass >/dev/null 2>&1; then
  source <(gopass completion bash)
fi

# direnv
if which direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi
