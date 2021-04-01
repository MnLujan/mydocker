DOCKER ?= docker
TARGET ?= mnlujan/asterisk16webrtc-realtime:latest

all:
	@echo "Building ${TARGET}"
	$(DOCKER) build -t $(TARGET) -f Dockerfile .
push:
	$(DOCKER) push $(TARGET)
