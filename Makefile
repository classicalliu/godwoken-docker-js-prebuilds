SHELL := /bin/bash

build-components:
	git submodule update --init --recursive

build-push:
	make build-components
	@read -p "Please Enter New Image Tag: " VERSION ; \
	docker build . -t nervos/godwoken-js-prebuilds:$$VERSION ; \
	docker push nervos/godwoken-js-prebuilds:$$VERSION

test:
	make build-test-image
	make test-jq
	make test-polyman
	make test-web3 

build-test-image:
	make build-components	
	docker build . -t nervos/godwoken-js-prebuilds:latest-test

test-jq:
	docker run --rm nervos/godwoken-js-prebuilds:latest-test /bin/bash -c "jq -V"

test-polyman:
	docker run --rm -v `pwd`/godwoken-polyman:/app nervos/godwoken-js-prebuilds:latest-test /bin/bash -c "cp -r godwoken-polyman/node_modules app/node_modules"
	cd godwoken-polyman && yarn check --verify-tree

test-web3:
	docker run --rm -v `pwd`/godwoken-web3:/app nervos/godwoken-js-prebuilds:latest-test /bin/bash -c "cp -r godwoken-web3/node_modules app/node_modules" ;
	cd godwoken-web3 && yarn check --verify-tree
