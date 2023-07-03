dotmodules = zsh vim git gnupg editorconfig
vimplugurl = https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
artifacts_dir = ci-artifacts

.PHONY: *
install: dotfiles-dir stow vim-plug prezto post-install
uninstall: unstow

homebrew-required:
	$(info Installing required homebrew packages)
	@brew bundle --file=modules/macOS/required/Brewfile

homebrew-essentials:
	$(info Installing essential homebrew packages)
	@brew bundle --file=modules/macOS/essentials/Brewfile

homebrew-extra:
	$(info Installing extra homebrew packages)
	@brew bundle --file=modules/macOS/extra/Brewfile

dotfiles-dir:
	$(info Writing install path to ~/.dotfiles-dir)
	@pwd > ~/.dotfiles-dir

prezto:
	$(info Setting up prezto)
	@git submodule update --quiet --init --recursive

stow:
	$(info Verifying if no current configs installed)
	@stow -n -d modules -t ~ $(dotmodules)
	$(info Installing dotfiles with stow)
	@stow -v -d modules -t ~ $(dotmodules)

unstow:
	$(info Uninstalling dotfiles with stow)
	@stow -D -d modules -t ~ $(dotmodules)

vim-plug:
	$(info Setting up vim-plug)
	@curl -fLso ~/.vim/autoload/plug.vim --create-dirs $(vimplugurl)
	@vim +PlugInstall +qall

post-install:
	$(info Running post-install hooks)
	@find hooks/post-install -maxdepth 1 -type f -exec {} \;

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
ifeq ($(shell uname),Darwin)
	$(info Starting/stopping zsh 10 times)
	@zsh -c "cd / && for i in $(shell seq 1 10); do /usr/bin/time zsh -i -c exit 2>&1 | sed -n 's/^[ ]*\([^ ]*\).*$$/\1/p'; done"
else
	$(info Starting/stopping zsh 10 times)
	@zsh -c "cd / && for i in $(shell seq 1 10); do /usr/bin/time -f '%e' zsh -i -c exit; done"
endif

ztime_avg:
	$(info Average zsh startup time:)
	@cat $(artifacts_dir)/ztime | tail +2 | awk '{ sum += $$1 } END { print(sum / NR) }'

test:
	$(info Testing dotfiles)
	@mkdir -p $(artifacts_dir)
	@$(MAKE) -s install
	@$(MAKE) -s zprof > $(artifacts_dir)/zprof 2>&1
	@$(MAKE) -s ztime > $(artifacts_dir)/ztime 2>&1
	@$(MAKE) -s ztime_avg > $(artifacts_dir)/ztime_avg 2>&1
	@$(MAKE) -s uninstall

docker-build:
	$(info Building container image for running tests)
	@docker build --target test -t dotfiles-test .

docker-test:
	$(info Running test in container)
	@mkdir -p $(artifacts_dir)
	@chmod 777 $(artifacts_dir)
	@docker run -v $(PWD)/$(artifacts_dir):/home/test-user/dotfiles/$(artifacts_dir) --rm -t dotfiles-test
