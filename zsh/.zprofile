# ~/.zprofile (2) - Interactive login

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

# kitty special
alias d="kitty +kitten diff"
alias ssh="kitty +kitten ssh"
alias icat="kitty +kitten icat"

# required by awsume
alias awsume="source awsume"

# GPG pinentry requires TTY
export GPG_TTY=$(tty)

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  ~/dotfiles/bin
  $path
)
