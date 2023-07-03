# Dotfiles (zsh, vim, macOS/linux, ...)

[![Dotfiles CI](https://github.com/tsertkov/dotfiles/actions/workflows/docfiles-ci.yml/badge.svg)](https://github.com/tsertkov/dotfiles/actions/workflows/docfiles-ci.yml)

Organised by topic, GNU stow powered dockerfiles for zsh, vim, macOs and Linux, etc.

<img width="1118" alt="Screenshot 2022-02-24 at 11 52 27" src="https://user-images.githubusercontent.com/5339042/155510771-2ada6c13-2fa2-4ba6-bcaa-d88f5d4cb14c.png">

## TLDR;

Explore dotfiles from within an isolated container without installing anything other then Docker:

`docker run --rm -it ghcr.io/tsertkov/dotfiles`.

## Prerequisites

- [stow](https://www.gnu.org/software/stow/)
- vim
- zsh
- curl

Run `make homebrew-required` to install required packages on macOS with Homebrew.

## Install

Clone dotfiles repo and run `make install` to install symlinks, vim plugins, etc.

```bash
git clone --depth 1 https://github.com/tsertkov/dotfiles.git ~/dotfiles
make -C dotfiles install
```

## Usage

- `make homebrew-required` - install required packages on macOS
- `make install` - install dotfiles
- `make uninstall` - uninstall dotfiles
- `make homebrew-essentials` - install essential packages on macOS
- `make homebrew-extra` - install extra packages on macOS
