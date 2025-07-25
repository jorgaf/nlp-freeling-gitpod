FROM ubuntu:22.04

RUN apt update && \
    apt install -y wget gdebi-core && \
    wget https://github.com/TALP-UPC/FreeLing/releases/download/4.2/freeling-4.2.1-jammy-amd64.deb && \
    gdebi -n freeling-4.2.1-jammy-amd64.deb && \
    rm freeling-4.2.1-jammy-amd64.deb
