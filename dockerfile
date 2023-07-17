FROM debian:stable-slim

ENV ALGO="minotaurx"
ENV POOL_ADDRESS="stratum+tcp://fastpool.xyz:6000"
ENV WALLET_USER="solo:MLegX9RugBiRMpJjmENLZEtnoPtGrF7o1hx"
ENV PASSWORD="x"
ENV EXTRAS="--api-enable --api-port 80 --disable-auto-affinity --disable-gpu"

RUN apt-get update && apt-get -y install wget xz-utils && \
    cd /opt && \
    wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.3.0/SRBMiner-Multi-2-3-0-Linux.tar.xz -O SRBMiner-Multi.tar.xz && \
    tar xf SRBMiner-Multi.tar.xz && \
    rm -rf /opt/SRBMiner-Multi.tar.xz && \
    mv /opt/SRBMiner-Multi-2-3-0/ /opt/SRBMiner-Multi/ && \
    apt-get -y purge xz-utils && \
    apt-get -y autoremove --purge && \
    apt-get -y clean && \
    apt-get -y autoclean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/SRBMiner-Multi/
COPY maza.sh .

RUN chmod +x maza.sh

EXPOSE 80

ENTRYPOINT ["./maza.sh"]
CMD ["--api-enable", "--api-port", "80", "--disable-auto-affinity", "--disable-gpu"]
