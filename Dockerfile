FROM node:14-buster 
MAINTAINER Retric Su <retric@cryptape.com>

COPY godwoken-web3/. /godwoken-web3/.
RUN cd /godwoken-web3 && yarn && yarn workspace @godwoken-web3/godwoken tsc && yarn workspace @godwoken-web3/api-server tsc

COPY godwoken-polyman/. /godwoken-polyman/.
RUN cd /godwoken-polyman && yarn 

RUN apt-get update \
 && apt-get dist-upgrade -y \
 && apt-get install jq -y \
 && apt-get clean \
 && echo "Finished installing dependencies"

EXPOSE 3000 6100 6101 6102 8024
