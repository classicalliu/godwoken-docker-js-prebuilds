SHELL := /bin/bash

build-components:
	git submodule update --init --recursive

build-test-image:
	make build-components	
	docker build . -t nervos/godwoken-js-prebuilds:latest-test

build-push:
	make build-components
	@read -p "Please Enter New Image Tag: " VERSION ; \
	docker build . -t nervos/godwoken-js-prebuilds:$$VERSION ; \
	docker push nervos/godwoken-js-prebuilds:$$VERSION

install-polyman:
	docker run --rm -v `pwd`/godwoken-polyman:/app -w=/app nervos/godwoken-js-prebuilds:latest-test /bin/bash -c "yarn"

install-web3:
	docker run --rm -v `pwd`/godwoken-web3:/app -w=/app nervos/godwoken-js-prebuilds:latest-test /bin/bash -c "yarn; yarn workspace @godwoken-web3/godwoken tsc; yarn workspace @godwoken-web3/api-server tsc" ;
