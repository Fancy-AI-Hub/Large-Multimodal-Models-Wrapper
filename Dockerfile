FROM nvcr.io/nvidia/pytorch:22.10-py3

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
    && apt-get install -y ffmpeg libsm6 libxext6 libglib2.0-0 git ca-certificates \
    && apt-get -y install tmux \
    && apt-get -y install nano \
    && apt-get clean

RUN pip install --upgrade setuptools pip wheel

WORKDIR /Large-Multimodal-Models-Wrapper
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . ./
