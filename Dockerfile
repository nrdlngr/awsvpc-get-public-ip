FROM nginx
RUN apt-get update -y && apt-get install -y curl jq python-pip && pip install awscli
ADD ./awsvpc-get-public-ip.sh /tmp/awsvpc-get-public-ip.sh
ENTRYPOINT /tmp/awsvpc-get-public-ip.sh
