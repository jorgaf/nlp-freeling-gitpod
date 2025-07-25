FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN apt update && apt install -y \
    git \
    wget \
    curl \
    gdebi-core \
    locales \
    ca-certificates \
    software-properties-common \
    unzip \
    zip \
    python3 \
    python3-pip

RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

RUN wget https://github.com/TALP-UPC/FreeLing/releases/download/4.2/freeling-4.2.1-jammy-amd64.deb && \
    gdebi -n freeling-4.2.1-jammy-amd64.deb && \
    rm freeling-4.2.1-jammy-amd64.deb