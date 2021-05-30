DOCKER ?= docker
TARGET ?= mnlujan/httpd-plotter:sup

all:
	@echo "Building ${TARGET}"
	$(DOCKER) build -t ${TARGET} -f Dockerfile .
push:
	@echo "Pushing ${TARGET}"
	$(DOCKER) push $(TARGET)