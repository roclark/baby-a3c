from roclark/gym-mupen64plus:0.1.0

WORKDIR /src

RUN apt update && \
    apt install -y python3 \
        python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install numpy==1.13.1 \
        pillow \
        scipy==0.19.1 \
        torch

RUN cd /src/gym-mupen64plus && \
    pip3 install -e .

COPY . baby-a3c
