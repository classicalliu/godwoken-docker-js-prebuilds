godwoken-docker-js-prebuilds
=========================

Docker image containing all js node_modules used by [godwoken-kicker](https://github.com/RetricSu/godwoken-kicker), saving you the hassles of building them yourself.

How to build:

```bash
$ git clone --recursive https://github.com/RetricSu/godwoken-docker-js-prebuilds.git
$ cd godwoken-docker-js-prebuilds
$ make build-test-image
```

How to upgrade:

```bash
$ # build and push to docker-hub, will ask you to enter image tag
$ make build-push
```

# Usage

the [Web3 compatible RPC layer](https://github.com/bitrocks/godwoken-web3) can be found at `/godwoken-web3`. All the node dependencies are already installed during docker image building phase, tho you might want to customize `/godwoken-web3/packages/api-server/.env` for database and godwoken RPC URLs.

[godwoken-polyman](https://github.com/RetricSu/godwoken-polyman), located at `/godwoken-polyman`, is used by godwoken-kicker to automatically issue an godwoken/polyjuice chain and setup everything needed for developer to deploy their old ETH smart contract on godwoken in the quickest way.
