DOCKER ?= docker
TARGET ?= mnlujan/asterisk16webrtc:2.0

all:
	@echo "Building ${TARGET}"
	$(DOCKER) build -t $(TARGET) -f Dockerfile .
push:
	$(DOCKER) push $(TARGET)
