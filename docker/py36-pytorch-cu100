FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04

RUN rm -rf /var/lib/apt/lists/* \
           /etc/apt/sources.list.d/cuda.list \
           /etc/apt/sources.list.d/nvidia-ml.list && \

    apt-get update && \

# ==================================================================
# tools
# ------------------------------------------------------------------
    apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        libopencv-dev \
        libsnappy-dev \
        cmake \
        wget \
        curl \
        git \
        vim \
        unrar \
        unzip

# ==================================================================
# Anaconda - python3.6.5
# ------------------------------------------------------------------
RUN wget --quiet https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/anaconda3 && \
    echo "export PATH=/opt/anaconda3/bin:$PATH" >> ~/.bashrc

# ==================================================================
# base
# ------------------------------------------------------------------
RUN /opt/anaconda3/bin/conda install -y pymysql

# ==================================================================
# pytorch
# ------------------------------------------------------------------
RUN /opt/anaconda3/bin/conda install -y pytorch torchvision cuda100 -c pytorch

# ==================================================================
# clean
# ------------------------------------------------------------------
RUN apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*

