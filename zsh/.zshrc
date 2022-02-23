# ~/.zshrv (3) Interactive (non-)login

# Source Prezto
source "${HOME}/dotfiles/prezto/init.zsh"

# key mappings
bindkey "^[^[[C"  forward-word              # alt + right
bindkey "^[^[[D"  backward-word             # alt + left
bindkey "^[^[[A"  _history-complete-older   # alt + up
bindkey "^[^[[B"  _history-complete-newer   # alt + down

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

# awsume autocomplete path
if which awsume >/dev/null 2>&1; then
  fpath=(~/.awsume/zsh-autocomplete/ $fpath)
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
