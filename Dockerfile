FROM nubificus/jetson-inference

RUN git clone https://${TOKEN}:x-oauth-basic@github.com/cloudkernels/virtio-accel.git && \
	cp virtio-accel/accel.h /usr/local/include
