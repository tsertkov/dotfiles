Dotfiles (zsh, vim, homebrew, os x, ...)
========================================

These are my personal taste dotfiles.

## Install

Download and execute installer:

```bash
$ sh -c "$(curl https://raw.github.com/tsertkov/dotfiles/master/installer)"
```

Installer will clones github repository into `~/dotfiles`, symlinks everything from `~/dotfiles/dots/` into `~` by prepending dot to original name. If dotfile already exists it will be backed up in `~/dotfiles-backup/`.

### Fonts

My preffered monospace font is Source Code Pro from Adobe. You have to install this font manually from `~/dotfiles/fonts/SourceCodePro/`.

Source Code Pro Bold looks too heavy in Terminal. To fix this you need to skip installing Bold font which will lead to Semibold used instead. Another option is disabling already installed font in Font Book if you are on OS X.

## Update

Installer will update dotfiles is run locally:

```bash
$ ~/dotfiles/installer
```
