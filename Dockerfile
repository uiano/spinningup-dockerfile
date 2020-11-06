FROM nvcr.io/nvidia/tensorflow:20.09-tf1-py3

LABEL  MAINTAINER="Sigurd Brinch <sigurd.k.brinch@uia.no>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    libopenmpi-dev \
    && apt-get clean \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /deps

RUN git clone https://github.com/uiano/spinningup.git \
    && python3 -m pip install -e spinningup

WORKDIR /app
