export
VERSION := local

.PHONY: tool
tool:
	@aqua install

.PHONY: build
build:
	@go build -ldflags "-X main.version=local" -o main

.PHONY: run
run:
	@make build
	@./main

.PHONY: ko
ko:
	@echo "${VERSION}"
	@envsubst '$$VERSION' < .ko.yaml.template > .ko.yaml

## 展開できずうまく動かず。。。
.PHONY: docker
docker: 
	@docker run --rm -p 8080:8080 $(ko publish --local .) 
