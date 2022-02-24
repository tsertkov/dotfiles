# Dotfiles (zsh, vim, macOS/linux, ...)

Organised by topic, GNU stow powered dockerfiles for zsh, vim, macOs and Linux, etc.

<img width="1148" alt="Screenshot 2022-02-24 at 11 47 59" src="https://user-images.githubusercontent.com/5339042/155510030-ef901296-46a3-4c53-8356-c37eb0a7b112.png">

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
