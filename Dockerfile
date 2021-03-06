from ubuntu:18.04

WORKDIR /src

RUN apt update && \
    apt install -y python3 \
        python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install gym \
        numpy==1.13.1 \
        pillow \
        scipy==0.19.1 \
        torch && \
    # This needs to be done separately from the last step for some reason.
    pip3 install gym[atari]

COPY . baby-a3c
