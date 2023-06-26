dotmodules = zsh vim git gnupg editorconfig
vimplugurl = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

all: stow vim-plug prezto post-install
.PHONY: *

prezto:
	@echo Setting up prezto...
	@git submodule update --init --recursive

stow:
	$(info Installing dotfiles with stow...)
	@stow -t ~ $(dotmodules)

unstow:
	$(info Uninstalling dotfiles with stow...)
	@stow -D -t ~ $(dotmodules)

vim-plug:
	$(info Setting up vim-plug...)
	@curl -fLso ~/.vim/autoload/plug.vim --create-dirs $(vimplugurl)
	@vim +PlugInstall +qall

post-install:
	$(info Running post-install scripts...)
	@find scripts -maxdepth 1 -type f -exec {} \;
