# Dotfiles (zsh, vim, macOS/linux, ...)

[![Dotfiles CI](https://github.com/tsertkov/dotfiles/actions/workflows/docfiles-ci.yml/badge.svg)](https://github.com/tsertkov/dotfiles/actions/workflows/docfiles-ci.yml)

Organised by topic, GNU stow powered dockerfiles for zsh, vim, macOs and Linux, etc.

<img width="1118" alt="Screenshot 2022-02-24 at 11 52 27" src="https://user-images.githubusercontent.com/5339042/155510771-2ada6c13-2fa2-4ba6-bcaa-d88f5d4cb14c.png">

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
