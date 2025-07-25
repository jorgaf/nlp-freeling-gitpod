FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Instalación de dependencias del sistema
RUN apt update && apt install -y \
    git \
    wget \
    curl \
    gdebi-core \
    locales \
    ca-certificates \
    python3 \
    python3-pip \
    unzip \
    zip \
    software-properties-common

# Configurar locale en_US.UTF-8
RUN locale-gen en_US.UTF-8 && update-locale LANG=en_US.UTF-8

# Instalar FreeLing
RUN wget https://github.com/TALP-UPC/FreeLing/releases/download/4.2/freeling-4.2.1-jammy-amd64.deb && \
    gdebi -n freeling-4.2.1-jammy-amd64.deb && \
    rm freeling-4.2.1-jammy-amd64.deb

# Instalar SDKMAN (para entorno Java)
RUN curl -s "https://get.sdkman.io" | bash && \
    bash -c "source /root/.sdkman/bin/sdkman-init.sh && sdk version"

# Instalar paquetes útiles de Python para análisis de RA
RUN pip3 install pandas

# Hacer que sdkman esté disponible en todos los shells
RUN echo "source /root/.sdkman/bin/sdkman-init.sh" >> /etc/bash.bashrc
