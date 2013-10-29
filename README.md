Dotfiles (zsh, vim, homebrew, os x, ...)
========================================

These are my personal taste dotfiles.

## Install

To download and execute installer run:

```bash
$ sh -c "$(curl https://raw.github.com/tsertkov/dotfiles/master/installer)"
```

Installer clones github repository into `~/dotfiles`, symlinks all files and folders from `~/dotfiles/dots/` into `~` by prepending dot to original name. If dotfile already exists it will be backed up in `~/dotfiles-backup/`.

## Update

Installer will update dotfiles if they were already installed:

```bash
$ ~/dotfiles/installer
```

## Fonts

My preffered monospace font is Source Code Pro from Adobe. You have to install this font manually from `~/dotfiles/fonts/SourceCodePro/`.

Source Code Pro Bold looks too heavy in Terminal. To fix this you need to skip installing Bold font which will lead to Semibold used instead. Another option is disabling already installed font in Font Book if you are on OS X.

## OS X

* `~/dotfiles/tools/osx-tweaks` Apply different OS X tweaks.
* `~/dotfiles/tools/osx-brew` Install required homebrew packages.
* `~/dotfiles/tools/osx-update` Notify via Notification center about outdated homebrew and npm packages.
* `~/dotfiles/osx/Services/Exiftool rename image.workflow` Rename selected images to according to format `%y%m%d-%H%M%S%%-c.%%e` with `exiftool`.
* `~/dotfiles/osx/Services/Exiftool rename all images.workflow` Rename all images in a folder.
* `~/dotfiles/osx/LaunchAgents/io.github.tsertkov.osx-update.plist` Run ~/dotfiles/tools/osx-update script daily.

## Zsh (Prezto)

Prezto configuration framework is used to configure zsh. It is cloned into `~/dotfiles/dots/zprezto` from sorin-ionescu/prezto https://github.com/sorin-ionescu/prezto.

### Custom aliases (`~/dotfiles/dots/zshrc`)

* `l` = `ls`
* `la` = `ls -a`
* `ll` = `ls -l`
* `lla` = `ls -la`
* `lm` = `lla | "$PAGER"`
* `s` = `screen -d -RR`
* `htop` = `sudo htop`
* `L` = `|less` # Global alias

### Prezto enabled modules

Follow these links to reach original module documentation.

* [`environment`](https://github.com/sorin-ionescu/prezto/tree/master/modules/environment) General shell options and environment variables.
* [`terminal`](https://github.com/sorin-ionescu/prezto/tree/master/modules/terminal) Set terminal window and tab titles.
* [`editor`](https://github.com/sorin-ionescu/prezto/tree/master/modules/editor) Command line editor key bindings.
* [`history`](https://github.com/sorin-ionescu/prezto/tree/master/modules/history) History options and history aliases.
* [`directory`](https://github.com/sorin-ionescu/prezto/tree/master/modules/directory) Directory options and directory aliases.
* [`spectrum`](https://github.com/sorin-ionescu/prezto/tree/master/modules/spectrum) Easier use of 256 colors and effects.
* [`utility`](https://github.com/sorin-ionescu/prezto/tree/master/modules/utility) General aliases and functions.
* [`completion`](https://github.com/sorin-ionescu/prezto/tree/master/modules/completion) Tab completions from the zsh-completions project.
* [`syntax-highlighting`](https://github.com/sorin-ionescu/prezto/tree/master/modules/syntax-highlighting) Syntax highlighting from zsh-syntax-highlighting.
* [`history-substring-search`](https://github.com/sorin-ionescu/prezto/tree/master/modules/history-substring-search) History search from zsh-history-substring-search.
* [`fasd`](https://github.com/sorin-ionescu/prezto/tree/master/modules/fasd) Command-line productivity booster.
* [`archive`](https://github.com/sorin-ionescu/prezto/tree/master/modules/archive) Functions to list and extract archives.
* [`git`](https://github.com/sorin-ionescu/prezto/tree/master/modules/git) Git aliases, functions and exposing repository status information to prompts.
* [`prompt`](https://github.com/sorin-ionescu/prezto/tree/master/modules/prompt) Prompt themes.

### Prezto aliases and functions

* `history-stat` lists the ten most used commands.
* `d` prints the contents of the directory stack.
* `1 ... 9` changes the directory to the n previous one.
* `_` executes a command as another user (`sudo`).
* `b` opens the default web browser.
* `cp` copies files and directories interactively.
* `e` opens the default editor.
* `ln` links files and directories interactively.
* `mkdir` creates directories, including intermediary directories.
* `mv` moves files and directories interactively.
* `p` opens the default pager.
* `po` removes a directory from the stack and changes to it (`popd`).
* `pu` changes the directory and pushes the old directory onto the stack (`pushd`).
* `rm` removes files and directories interactively.
* `type` displays all the attribute values of a shell parameter.
* `ls` lists with directories grouped first (GNU only).
* `l`  lists in one column, hidden files.
* `ll` lists human readable sizes.
* `lr` lists human readable sizes, recursively.
* `la` lists human readable sizes, hidden files.
* `lm` lists human readable sizes, hidden files through pager.
* `lx` lists sorted by extension (GNU only).
* `lk` lists sorted by size, largest last.
* `lt` lists sorted by date, most recent last.
* `lc` lists sorted by date, most recent last, shows change time.
* `lu` lists sorted by date, most recent last, shows access time.
* `sl` lists directory contents (`ls`).
* `o` opens files and directories (`open` or `xdg-open`).
* `get` downloads files (`curl` or `wget`).
* `pbcopy` copies to the pasteboard (`pbcopy`, `xclip` or `xsel`).
* `pbpaste` pastes from the pasteboard (`pbcopy`, `xclip` or `xsel`).
* `pbc` copies to the pasteboard (`pbcopy`).
* `pbp` pastes from the pasteboard (`pbpaste`).
* `df` displays free disk space using human readable units.
* `du` displays disk usage using human readable units.
* `top` displays information about processes (aliased to `htop`, if installed).
* `topc` displays information about processes sorted by CPU usage (`htop` not installed).
* `topm` displays information about processes sorted by RAM usage (`htop` not installed).
* `http-serve` serves a directory via HTTP.
* `slit` prints columns *1, 2, 3 ... n*.
* `cdls` changes to a directory and lists its contents.
* `dut` displays the grand total disk usage using human readable units.
* `find-exec` finds files and executes a command on them.
* `mkdcd` makes a directory and changes to it.
* `popdls` pops an entry off the directory stack and lists its contents.
* `pushdls` pushes an entry onto the directory stack and lists its contents.
* `diff` highlights diff output (requires `colordiff` or `Git`).
* `make` highlights make output (requires `colormake`).
* `wdiff` highlights wdiff output (requires `wdiff `or `Git`).
* `psu` displays user owned processes status.
* `prep` provides a grep-like pattern search.
* `psub` provides a sed-like pattern substitution.
* `lsarchive` lists the contents of one or more archives.
* `unarchive` extracts the contents of one or more archives.
* `g` is short for `git`.
* `gb` lists, creates, renames, and deletes branches.
* `gbc` creates a new branch.
* `gbl` lists branches and their commits.
* `gbL` lists local and remote branches and their commits.
* `gbs` lists branches and their commits with ancestry graphs.
* `gbS` lists local and remote branches and their commits with ancestry graphs.
* `gbx` deletes a branch.
* `gbX` deletes a branch irrespective of its merged status.
* `gbm` renames a branch.
* `gbM` renames a branch even if the new branch name already exists.
* `gc` records changes to the repository.
* `gca` stages all modified and deleted files.
* `gcm` records changes to the repository with the given message.
* `gco` checks out a branch or paths to work tree.
* `gcO` checks out hunks from the index or the tree interactively.
* `gcf` amends the tip of the current branch using the same log message as *HEAD*.
* `gcF` amends the tip of the current branch.
* `gcp` applies changes introduced by existing commits.
* `gcP` applies changes introduced by existing commits without committing.
* `gcr` reverts existing commits by reverting patches and recording new commits.
* `gcR` removes the *HEAD* commit.
* `gcs` displays various types of objects.
* `gcl` lists lost commits.
* `gCl` lists unmerged files.
* `gCa` adds unmerged file contents to the index.
* `gCe` executes merge-tool on all unmerged file.
* `gCo` checks out our changes for unmerged paths.
* `gCO` checks out our changes for all unmerged paths.
* `gCt` checks out their changes for unmerged paths.
* `gCT` checks out their changes for all unmerged paths.
* `gd` displays information about files in the index and the work tree.
* `gdc` lists cached files.
* `gdx` lists deleted files.
* `gdm` lists modified files.
* `gdu` lists untracked files.
* `gdk` lists killed files.
* `gdi` lists ignored files.
* `gf` downloads objects and references from another repository.
* `gfc` clones a repository into a new directory.
* `gfm` fetches from and merges with another repository or local branch.
* `gfr` fetches from and rebases on another repository or local branch.
* `gg` displays lines matching a pattern.
* `ggi` displays lines matching a pattern ignoring case.
* `ggl` lists files matching a pattern.
* `ggL` lists files that are not matching a pattern.
* `ggv` displays lines not matching a pattern.
* `ggw` displays lines matching a pattern at word boundary.
* `gia` adds file contents to the index.
* `giA` adds file contents to the index interactively.
* `giu` adds file contents to the index (updates only known files).
* `gid` displays changes between the index and a named commit (diff).
* `giD` displays changes between the index and a named commit (word diff).
* `gir` resets the current HEAD to the specified state.
* `giR` resets the current index interactively.
* `gix` removes files/directories from the index (recursively).
* `giX` removes files/directories from the index (recursively and forced).
* `gl` displays the log.
* `gls` displays the stats log.
* `gld` displays the diff log.
* `glo` displays the one line log.
* `glg` displays the graph log.
* `glb` displays the brief commit log.
* `glc` displays the commit count for each contributor in descending order.
* `gm` joins two or more development histories together.
* `gmC` joins two or more development histories together but does not commit.
* `gmF` joins two or more development histories together but does not commit generating a merge commit even if the * rge resolved as a fast-forward.
* `gma` aborts the conflict resolution, and reconstructs the pre-merge state.
* `gmt` runs the merge conflict resolution tools to resolve conflicts.
* `gp` updates remote refs along with associated objects.
* `gpf` forcefully updates remote refs along with associated objects.
* `gpa` updates remote branches along with associated objects.
* `gpA` updates remote branches and tags along with associated objects.
* `gpt` updates remote tags along with associated objects.
* `gpc` updates remote refs along with associated objects and adds *origin* as an upstream reference for the * rrent branch.
* `gpp` pulls and pushes from origin to origin.
* `gr` forward-ports local commits to the updated upstream head.
* `gra` aborts the rebase.
* `grc` continues the rebase after merge conflicts are resolved.
* `gri` makes a list of commits to be rebased and opens the editor.
* `grs` skips the current patch.
* `gR` manages tracked repositories.
* `gRl` lists remote names and their URLs.
* `gRa` adds a new remote.
* `gRx` removes a remote.
* `gRm` renames a remote.
* `gRu` fetches remotes updates.
* `gRp` prunes all stale remote tracking branches.
* `gRs` displays information about a given remote.
* `gRb` opens a remote on [GitHub][3] in the default browser.
* `gs` stashes the changes of the dirty working directory.
* `gsa` applies the changes recorded in a stash to the working directory.
* `gsx` drops a stashed state.
* `gsX` drops all the stashed states.
* `gsl` lists stashed states.
* `gsL` lists dropped stashed states.
* `gsd` displays changes between the stash and its original parent.
* `gsp` removes and applies a single stashed state from the stash list.
* `gsr` recovers a given stashed state.
* `gss` stashes the changes of the dirty working directory, including untracked.
* `gsS` stashes the changes of the dirty working directory interactively.
* `gsw` stashes the changes of the dirty working directory retaining the index.
* `gS` initializes, updates, or inspects submodules.
* `gSa` adds given a repository as a submodule.
* `gSf` evaluates a shell command in each of checked out submodules.
* `gSi` initializes submodules.
* `gSI` initializes and clones submodules recursively.
* `gSl` lists the commits of all submodules.
* `gSm` moves a submodule.
* `gSs` synchronizes submodules' remote URL to the value specified in .gitmodules.
* `gSu` fetches and merges the latest changes for all submodule.
* `gSx` removes a submodule.
* `gws` displays working-tree status in the short format.
* `gwS` displays working-tree status.
* `gwd` displays changes between the working tree and the index (diff).
* `gwD` displays changes between the working tree and the index (word diff).
* `gwr` resets the current HEAD to the specified state, does not touch the index nor the working tree.
* `gwR` resets the current HEAD, index and working tree to the specified state.
* `gwc` removes untracked files from the working tree (dry-run).
* `gwC` removes untracked files from the working tree.
* `gwx` removes files from the working tree and from the index recursively.
* `gwX` removes files from the working tree and from the index recursively and forcefully.
* `git-branch-current` displays the current branch.
* `git-commit-lost` lists lost commits.
* `git-dir` displays the path to the Git directory.
* `git-hub-browse` opens the [GitHub][3] repository in the default browser.
* `git-hub-shorten-url` shortens GitHub URLs.
* `git-info` exposes repository information via the `$git_info` associative array.
* `git-root` displays the path to the working tree root.
* `git-stash-clear-interactive` asks for confirmation before clearing the stash.
* `git-stash-dropped` lists dropped stashed states.
* `git-stash-recover` recovers given dropped stashed states.
* `git-submodule-move` moves a submodule.
* `git-submodule-remove` removes a submodule.
* `j` changes the current working directory interactively.
* Type `,`, `f,`, `d,` in front of a comma-separated query or type `,,`,  `,,f`,
`,,d` at the end of a comma-separated query then hit <kbd>tab</kbd>.

## Vim (Vundle)

Vim plugins are managed by Vundle which is cloned into `~/dotfiles/dots/vim/bundle/vundle` from https://github.com/gmarik/vundle.

### Vundle installed modules

* [`Lokaltog/vim-powerline`](https://github.com/Lokaltog/vim-powerline) The ultimate vim statusline utility.
* [`Raimondi/YAIFA`](https://github.com/Raimondi/YAIFA) Yet Another Indent Finder, Almost...
* [`sjl/gundo.vim`](https://github.com/sjl/gundo.vim) Visualize your Vim undo tree.
* [`tpope/vim-repeat`](https://github.com/tpope/vim-repeat) Enable repeating supported plugin maps with "."
* [`tpope/vim-unimpaired`](https://github.com/tpope/vim-unimpaired) Pairs of handy bracket mappings.
* [`altercation/vim-colors-solarized`](https://github.com/altercation/vim-colors-solarized) Precision colorscheme for the vim text editor.
* [`tpope/vim-markdown`](https://github.com/tpope/vim-markdown) Markdown support.
* [`sickill/vim-pasta`](https://github.com/sickill/vim-pasta) Pasting with indentation adjusted to destination context.
* [`scrooloose/syntastic`](https://github.com/scrooloose/syntastic) Syntax checking hacks.
* [`tomtom/tcomment_vim`](https://github.com/tomtom/tcomment_vim) Toggle comments.
* [`ervandew/supertab`](https://github.com/ervandew/supertab) Insert mode completions with Tab.
* [`tpope/vim-surround`](https://github.com/tpope/vim-surround) Quoting/parenthesizing made simple.
* [`Raimondi/delimitMate`](https://github.com/Raimondi/delimitMate) Insert mode auto-completion for quotes, parens, brackets, etc.
* [`nathanaelkane/vim-indent-guides`](https://github.com/nathanaelkane/vim-indent-guides) Visually displaying indent levels.
* [`tpope/vim-git`](https://github.com/tpope/vim-git) Git support.
* [`tpope/vim-fugitive`](https://github.com/tpope/vim-fugitive) Git wrapper.
* [`int3/vim-extradite`](https://github.com/int3/vim-extradite) A git commit browser / git log wrapper that extends fugitive.vim.
* [`sjl/splice.vim`](https://github.com/sjl/splice.vim) Resolving conflicts during three-way merges.
* [`mattn/emmet-vim`](https://github.com/mattn/emmet-vim) Expanding abbreviations similar to emmet.
* [`othree/html5.vim`](https://github.com/othree/html5.vim) HTML5 omnicomplete and syntax.
* [`sorin-ionescu/vim-htmlvalidator`](https://github.com/sorin-ionescu/vim-htmlvalidator) HTML compiler for validating against http://validator.nu.
* [`ChrisYip/Better-CSS-Syntax-for-Vim`](https://github.com/ChrisYip/Better-CSS-Syntax-for-Vim) Better CSS Syntax.
* [`groenewege/vim-less`](https://github.com/groenewege/vim-less) Syntax for LESS (dynamic CSS).
* [`pangloss/vim-javascript`](https://github.com/pangloss/vim-javascript) Vastly improved Javascript indentation and syntax support.