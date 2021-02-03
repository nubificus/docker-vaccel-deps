FROM nubificus/jetson-inference

ARG TOKEN

RUN apt-get update && apt-get install -y \
    curl \
    clang libclang-dev llvm-dev

ENV RUSTUP_HOME=/opt/rust CARGO_HOME=/opt/cargo PATH=/opt/cargo/bin:$PATH
RUN wget --https-only --secure-protocol=TLSv1_2 -O- https://sh.rustup.rs | sh /dev/stdin -y

RUN git clone https://${TOKEN}:x-oauth-basic@github.com/cloudkernels/virtio-accel.git && \
	cd virtio-accel && \
	cp accel.h /usr/local/include
