install:
	dep ensure

unit:
	@(go list ./... | grep -v "vendor/" | xargs -n1 go test -v -cover)

integrations:
	npm install
	./scripts/run-tests.sh

format:
	@(go fmt ./...)
	@(go vet ./...)

test: unit integrations

docker-build:
	docker build -t aldo007/mort -f Dockerfile .

docker-push:
	docker push aldor007/mort:latest

run-server:
	go run cmd/mort.go