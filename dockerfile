FROM debian:stable-slim

WORKDIR /opt

RUN apt-get update && apt-get install -y wget xz-utils && \
    wget https://github.com/doktor83/SRBMiner-Multi/releases/download/1.0.7/SRBMiner-Multi-1-0-7-Linux.tar.xz && \
    tar -xvf SRBMiner-Multi-1-0-7-Linux.tar.xz && \
    rm SRBMiner-Multi-1-0-7-Linux.tar.xz

WORKDIR /opt/SRBMiner-Multi-1-0-7

CMD ["./SRBMiner-MULTI", "--algorithm", "minotaurx", "--pool", "stratum+tcp://fastpool.xyz:6000", "--wallet", "solo:MLegX9RugBiRMpJjmENLZEtnoPtGrF7o1hx", "--timeout", "120", "-p", "x"]
