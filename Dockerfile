FROM debian:bookworm

# install software deps
RUN set -eu; \
  apt update; \
  apt upgrade -y; \
  apt install -y zsh vim stow curl git time make; \
  rm -rf /var/lib/apt/lists/*

# setup local user
ENV HOME=/home/test-user
ENV USER=test-user
RUN set -eu; \
  useradd -s /usr/bin/zsh -d $HOME -m $USER
USER $USER

WORKDIR $HOME/dotfiles
COPY --chown=$USER . .
CMD [ "make", "test" ]
