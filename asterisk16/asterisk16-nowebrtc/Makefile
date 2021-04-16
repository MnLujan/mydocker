DOCKER ?= docker
TARGET ?= mnlujan/asterisk16-nowebrtc:latest

all:
	@echo "Building ${TARGET}"
	$(DOCKER) build -t $(TARGET) -f Dockerfile .
push:
	$(DOCKER) push $(TARGET)