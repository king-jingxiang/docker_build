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
        cmake \
        wget \
        curl \
        git \
        vim

# ==================================================================
# Anaconda - python3.6.5
# ------------------------------------------------------------------
RUN cd /tmp && \
    wget https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh && \
    bash ./Anaconda3-5.2.0-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    ln -s /opt/anaconda3/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/anaconda3/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# 安装pytorch
RUN /opt/anaconda3/bin/conda install -y pytorch torchvision cuda100 -c pytorch

# 安装tensorflow
RUN /opt/anaconda3/bin/conda install -y -c anaconda tensorflow-gpu

# 安装keras
RUN /opt/anaconda3/bin/conda install -y -c anaconda keras

# 安装caffe
RUN /opt/anaconda3/bin/conda install -y -c anaconda caffe-gpu

# ==================================================================
# clean
# ------------------------------------------------------------------
RUN apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*

