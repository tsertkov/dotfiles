# Dotfiles (zsh, vim, macOS/linux, ...)

Organised by topic GNU stow powered dockerfiles for zsh, vim, macOs and Linux, etc.

## Install

Clone dotfiles repo into `~/dotfiles` and run `make` to install symlinks, vim plugins, etc.

```bash
git clone --depth 1 https://github.com/tsertkov/dotfiles.git ~/dotfiles
cd ~/dotfiles && make
```

## Prerequisites

- [stow](https://www.gnu.org/software/stow/)
- vim
- zsh
- curl

## Usage

Install all essential cli tools at once on macOS with `./macOS/brew-install-essentials.sh`.

To uninstall symlinks run: `make unstow`
