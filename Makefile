.Phony := all

image-alpine-nasm := $(shell docker images -q alpine-nasm)
image-true := $(shell docker images -q true)

all: image-alpine-nasm true.tar image-true

image-alpine-nasm:
ifndef image-alpine-nasm
	@packer build -color=false alpine-nasm.json
endif

true.tar: compile.json
	@packer build -color=false compile.json
	@-docker rmi -f true
	@docker build -t true .

image-true:
ifndef image-true
	@docker build -t true .
endif


clean:
	@-rm true.tar
	@-docker rmi -f true
	@-docker rmi -f alpine-nasm

test: all
	docker run --rm true && echo "true" || echo "false"
