FROM ubuntu:latest

WORKDIR /opt

RUN apt-get update && apt-get install -y wget xz-utils && \
    wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.3.0/SRBMiner-Multi-2-3-0-Linux.tar.xz && \
    tar -xvf SRBMiner-Multi-2-3-0-Linux.tar.xz && \


WORKDIR /opt/SRBMiner-Multi-1-0-7

ENTRYPOINT ["./SRBMiner-MULTI"]
CMD ["--algorithm", "minotaurx", "--pool", "stratum+tcp://fastpool.xyz:6000", "--wallet", "solo:MLegX9RugBiRMpJjmENLZEtnoPtGrF7o1h", "--timeout", "120", "-p", "x"]
