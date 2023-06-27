dotmodules = zsh vim git gnupg editorconfig
vimplugurl = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
artifacts_dir = ci-artifacts

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
	@zsh -c "cd / && for i in $(shell seq 1 10); do /usr/bin/time -f '%e' zsh -i -c exit; done"

ztime_avg:
	$(info Starting/stopping zsh 10 times)
	@cat $(artifacts_dir)/ztime | tail +2 | awk '{ sum += $$1 } END { print(sum / NR) }'

test:
	@$(MAKE) -s install
	@$(MAKE) -s zprof > $(artifacts_dir)/zprof 2>&1
	@$(MAKE) -s ztime > $(artifacts_dir)/ztime 2>&1
	@$(MAKE) -s ztime_avg > $(artifacts_dir)/ztime_avg 2>&1
	@$(MAKE) -s uninstall

docker-test:
	mkdir -p $(artifacts_dir)
	chmod 777 $(artifacts_dir)
	docker build --progress=plain -t zsh-dotfiles-test .
	docker run -v $(PWD)/$(artifacts_dir):/home/test-user/dotfiles/$(artifacts_dir) --rm -t zsh-dotfiles-test
