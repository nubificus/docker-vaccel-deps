FROM nubificus/jetson-inference

ARG TOKEN

RUN apt-get update && apt-get install -y \
    curl \
    clang libclang-dev llvm-dev

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN echo "source $HOME/.cargo/env" >> $HOME/.bashrc

RUN git clone https://${TOKEN}:x-oauth-basic@github.com/cloudkernels/virtio-accel.git && \
	cd virtio-accel && \
	cp accel.h /usr/local/include
