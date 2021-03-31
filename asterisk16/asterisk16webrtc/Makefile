DOCKER ?= docker
TARGET ?= mnlujan/asterisk16webrtc:2.1

all:
	@echo "Building ${TARGET}"
	$(DOCKER) build -t $(TARGET) -f Dockerfile .
push:
	$(DOCKER) push $(TARGET)
