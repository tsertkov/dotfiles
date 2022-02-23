dotmodules = zsh vim git gnupg editorconfig
vimplugurl = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: all
all: stow vim-plug

.PHONY: prezto
prezto:
	@echo Updating/installing prezto
	@git submodule update --init --recursive

.PHONY: stow
stow:
	@stow -t ~ $(dotmodules)

.PHONY: unstow
	@stow -D -t ~ $(dotmodules)

.PHONY: vim-plug
vim-plug:
	@curl -fLso ~/.vim/autoload/plug.vim --create-dirs $(vimplugurl)
	vim +PlugInstall +qall
