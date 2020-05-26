FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# some tools
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y sudo vim git gdb python python3 tmux zsh python3-pip rr wget curl strace htop socat netcat lsb-core

# setup new user
RUN useradd -s /usr/bin/zsh -m -u 1000 user && \
gpasswd -a user sudo && \
echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER user

RUN mkdir /home/user/git && \
cd /home/user/git && \
git clone https://github.com/r4xjs/dotfiles && \
cd dotfiles && \
./install.sh && \

# install more debug stuff
RUN cd /home/user/git && \
git clone https://github.com/pwndbg/pwndbg && \
cd pwndbg && \
./setup.sh && \
sudo chmod -R o+rx /usr/local/lib/python3.6/dist-packages
RUN echo "set context-sections ''" >> /home/user/.gdbinit
RUN pip install pwntools


# install v8 build stuff
RUN cd /home/user/git && \
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git && \
echo 'export PATH=$PATH:/home/user/git/depot_tools' >> /home/user/.zshrc
