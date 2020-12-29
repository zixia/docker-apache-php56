#
# Credit: Huan LI <zixia@zixia.net> github.com/huan
#
.PHONY: test
test:
	./scripts/test.sh

.PHONY: build
build:
	docker build -t apache-php56 .

.PHONY: run
run:
	docker run \
		--name apache-php56 \
		--rm \
		-ti \
		-p 8080:80 \
		--entrypoint bash \
		apache-php56

.PHONY: clean
clean:
	docker rmi apache-php56

.PHONY: version
version:
	./scripts/version.sh
