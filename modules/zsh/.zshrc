# ~/.zshrc Interactive (non-)login

# enable profiling
if [[ -n $__zprof ]]; then
  zmodload zsh/zprof
fi

# define global var DOTFILESDIR
DOTFILESDIR=$(/bin/cat ${HOME}/.dotfiles-dir)

# enable local completions
fpath=($DOTFILESDIR/var/zsh-site-functions $fpath)

# Source Prezto
source "${DOTFILESDIR}/modules/prezto/init.zsh"

# key mappings
bindkey "^[^[[C"  forward-word              # alt + right
bindkey "^[^[[D"  backward-word             # alt + left
bindkey "^[^[[A"  _history-complete-older   # alt + up
bindkey "^[^[[B"  _history-complete-newer   # alt + down

# Std aliases

alias ls="ls --color=auto"
alias -g L="|less"

#
# Paths
#

typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  $DOTFILESDIR/bin
  $path
)

# load zsh_cached_init function
autoload -Uz zsh_cached_init

# Enable homebrew paths in macOS
if [[ "$OSTYPE" == darwin* ]]; then
  if (( $+commands[brew] )); then
    zsh_cached_init brew "brew shellenv"
  elif [ -x /opt/homebrew/bin/brew ]; then
    zsh_cached_init brew "/opt/homebrew/bin/brew shellenv"
  fi
fi

# gpg-agent
if (( $+commands[gpg-agent] )); then
  # export SSH_AUTH_SOCK every time to overwrite defauls on macOS
  if [[ "$OSTYPE" == darwin* ]]; then
    export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
    export GPG_TTY=$TTY
  fi

  if ! ps x -o pid,ucomm | grep -q -- 'gpg-agent'; then
    if [ ! -S "${HOME}/.gnupg/S.gpg-agent.ssh" ]; then
      local pinentry
      if (( $+commands[pinentry-mac] )); then
        gpg-agent --daemon --enable-ssh-support --pinentry-program $commands[pinentry-mac] >/dev/null
      else
        gpg-agent --daemon --enable-ssh-support >/dev/null
      fi

      export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
      export GPG_TTY=$TTY
    fi
  fi
fi

# modern apps

if (( $+commands[eza] )); then
  alias ll="eza -l"
  alias lla="eza -la"
fi

if (( $+commands[curlie] )); then
  alias curll=curlie
fi

if (( $+commands[procs] )); then
  alias pss=procs
fi

if (( $+commands[bat] )); then
  alias catt=bat
fi

if (( $+commands[dust] )); then
  alias duu=dust
fi

if (( $+commands[fd] )); then
  alias findd=fd
fi

if (( $+commands[gopass] )); then
  alias p="gopass show"
  alias pc="gopass show -c"
  alias pf="gopass show -f"
  alias pass=gopass
fi

if (( $+commands[git] )); then
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
fi

# kitty special
if (( $+commands[kitty] )); then
  alias d="kitty +kitten diff"
  alias ssh="kitty +kitten ssh"
  alias icat="kitty +kitten icat"
fi

# direnv
if (( $+commands[direnv] )); then
  zsh_cached_init direnv "direnv hook zsh"
fi

# rbenv
if (( $+commands[rbenv] )); then
  zsh_cached_init rbenv "rbenv init - zsh"
fi

# granted
if (( $+commands[assume] )); then
  alias assume=". assume"
fi

# end profiling
if [[ -n $__zprof ]]; then
  zprof
fi

