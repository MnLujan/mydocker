DOCKER ?= docker
TARGET ?= mnlujan/asterisk16-nowebrtc:dev2

all:
	@echo "Building ${TARGET}"
	$(DOCKER) build -t $(TARGET) -f Dockerfile .
push:
	$(DOCKER) push $(TARGET)
