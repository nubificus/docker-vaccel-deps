FROM nubificus/jetson-inference

ARG TOKEN
RUN git clone https://${TOKEN}:x-oauth-basic@github.com/cloudkernels/virtio-accel.git && \
	cd virtio-accel && git checkout cleanup && \
	cp accel.h /usr/local/include
