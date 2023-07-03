ARG FROM=debian:bookworm
FROM ${FROM} as base

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

COPY --chown=$USER . $HOME/dotfiles
WORKDIR $HOME/dotfiles
VOLUME $HOME/dotfiles/ci-artifacts

# final test image stage
FROM base as test
CMD [ "make", "test" ]

# final demo image stage
FROM base as dotfiles
RUN make install
CMD [ "zsh", "-l" ]