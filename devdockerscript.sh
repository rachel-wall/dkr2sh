# FROM ubuntu:18.04
# MAINTAINER Rachel Wall
apt-get -y update
apt-get -y upgrade
apt-get install -y tzdata
export TZ="America/New_York"
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
apt-get install -y \
autoconf \
build-essential \
pkg-config \
libssl-dev \
gdb \
git \
iproute2 \
iputils-ping \
wget \ 
doxygen \
sudo \
vim \
libtool \
software-properties-common \
gcc-avr \
avr-libc \
srecord \
vim-gtk3 

add-apt-repository ppa:ubuntu-toolchain-r/test
apt install -y \
software-properties-common \
gcc-9 \
g++-9 \
libz-dev \
libsocketcan-dev

update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 9
update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 9
update-alternatives --config gcc
update-alternatives --config g++
git config --global url.ssh://git@github.com/.insteadOf https://github.com/
wget https://gitlab.kitware.com/cmake/cmake/-/archive/v3.23.2/cmake-v3.23.2.tar.gz
tar -xvzf ./cmake-v3.23.2.tar.gz
mkdir -p /cmake-v3.23.2 && cd /cmake-v3.23.2
./bootstrap
make install
mkdir -p / && cd /
wget https://github.com/cpputest/cpputest/archive/refs/tags/v4.0.tar.gz
tar -xvzf ./v4.0.tar.gz
mkdir -p /cpputest-4.0/cpputest_build && cd /cpputest-4.0/cpputest_build
autoreconf .. -i
../configure
make install
 
echo "set ts=4 sw=4" > ~/.vimrc


export TERM=xterm-256color

export CACHEBUST=1


# EXPOSE 8887

useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

# USER docker
# CMD /bin/bash


mkdir -p /app && cd /app
