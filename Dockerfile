FROM arm64v8/debian:stable-slim

RUN mkdir /ns-3-dev
WORKDIR /ns-3-dev 
VOLUME . /ns-3-dev

# Install essential binaries
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git build-essential python3-dev gdb htop

# Clone ns-3 latest

RUN git clone https://github.com/nsnam/ns-3-dev-git.git .
RUN git clone https://github.com/signetlabdei/lorawan src/lorawan
RUN ./waf configure --enable-examples --enable-tests --enable-mpi && ./waf build
RUN ./waf --run scratch/scratch-simulator

ENTRYPOINT [ "/bin/bash" ]
