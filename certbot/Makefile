DOCKER ?= docker
TARGET ?= mnlujan/certbot:latest

all:
		@echo "Creando Imagen de ${TARGET}"
		$(DOCKER) build -t $(TARGET) -f Dockerfile .
push:
		$(DOCKER) push $(TARGET)