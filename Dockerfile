FROM debian:bookworm

# install software deps
RUN set -eu; \
  apt update; \
  apt upgrade -y; \
  apt install -y zsh vim stow curl git time make; \
  rm -rf /var/lib/apt/lists/*

# setup local user
ENV HOME=/home/test-user
RUN set -eu; \
  useradd -s /usr/bin/zsh -d $HOME -m test-user
USER test-user

WORKDIR $HOME/dotfiles
CMD [ "make", "test" ]