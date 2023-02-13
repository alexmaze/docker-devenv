FROM ubuntu:22.04

# basic
RUN apt update && \
  apt install -y \
  git sudo zsh \
  curl wget tmux \
  lua5.4 mycli \
  zoxide inetutils-ping htop dnsutils mtr \
  build-essential \
  openssh-server \
  software-properties-common gpg

# golang
RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt update && \
  apt install -y golang

# nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash -
RUN apt-get install -y nodejs

# vscode server
RUN wget -O- https://aka.ms/install-vscode-server/setup.sh | sh

# neovim
RUN wget https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb && \
  dpkg -i ./nvim-linux64.deb && \
  rm ./nvim-linux64.deb

# user
RUN useradd -m alex -G sudo
RUN echo "alex:123123" | chpasswd
USER alex
WORKDIR /home/alex

# zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ADD .zshrc /home/alex/.zshrc

# lunarvim
RUN wget https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh && \
  bash install.sh --no-install-dependencies && \
  rm install.sh

RUN ssh-keygen -t rsa -P "" -f ~/.ssh/id_rsa