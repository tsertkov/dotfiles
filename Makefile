dotmodules = zsh vim git gnupg editorconfig
vimplugurl = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: all
all: stow vim-plug prezto

.PHONY: prezto
prezto:
	@echo Setting up prezto...
	@git submodule update --init --recursive

.PHONY: stow
stow:
	@echo Installing dotfiles with stow...
	@stow -t ~ $(dotmodules)

.PHONY: unstow
unstow:
	@echo Uninstalling dotfiles with stow...
	@stow -D -t ~ $(dotmodules)

.PHONY: vim-plug
vim-plug:
	@echo Setting up vim-plug...
	@curl -fLso ~/.vim/autoload/plug.vim --create-dirs $(vimplugurl)
	@vim +PlugInstall +qall
