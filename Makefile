dotmodules = zsh vim git gnupg editorconfig
vimplugurl = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: *
install: stow vim-plug prezto post-install
uninstall: unstow

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

update-prezto:
	$(info Updating prezto git submodule to the latest version)
	@git submodule update --remote prezto

reset-prezto:
	$(info Resetting prezto git submodule to checked in version)
	@git submodule deinit -f prezto
	@git submodule update --init prezto

zprof:
	$(info Profiling single zsh run)
	@__zprof=1 zsh -i -c exit

ztime:
	$(info Starting/stopping zsh 10 times)
	@zsh -c "for i in $(shell seq 1 10); do time zsh -i -c exit; done"

test:
	$(MAKE) -s install
	$(MAKE) -s zprof
	$(MAKE) -s ztime
	$(MAKE) -s uninstall

docker-test:
	docker build --progress=plain -t zsh-dotfiles .
