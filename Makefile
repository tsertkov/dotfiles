.PHONY: all
all: stow vim-plug

.PHONY: stow
stow:
	@stow -t ~ vim git gnupg  zsh editorconfig

.PHONY: unstow
	@stow -D -t ~ vim git gnupg zsh editorconfig

.PHONY: vim-plug
vim-plug:
	@curl -fLos ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall
