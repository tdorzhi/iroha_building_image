FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y --no-install-recommends install \
build-essential automake libtool \
libssl-dev zlib1g-dev \
libc6-dbg golang \
git tar gzip ca-certificates \
wget curl file unzip \
python cmake \
docker docker-compose libboost-all-dev \
apt-utils gnupg sudo python3-software-properties software-properties-common \
vim openjdk-8-jdk swig gradle
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-cache policy docker-ce
RUN apt-get install -y docker-ce
RUN git clone -b master https://github.com/hyperledger/iroha --depth=1

WORKDIR /iroha
