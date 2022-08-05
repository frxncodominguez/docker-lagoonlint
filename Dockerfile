FROM alpine:3.15.5

ARG LAGOONLINTER_VERSION=0.7.0

LABEL name="docker-lagoonlinter"
LABEL maintainer="Franco Dominguez <frxncodominguez@gmail.com>"

LABEL version="$LAGOONLINTER_VERSION"

ADD https://github.com/uselagoon/lagoon-linter/releases/download/v${LAGOONLINTER_VERSION}/lagoon-linter_${LAGOONLINTER_VERSION}_linux_amd64.tar.gz /

RUN tar -xzf lagoon-linter_${LAGOONLINTER_VERSION}_linux_amd64.tar.gz -C /usr/bin && \
	rm lagoon-linter_${LAGOONLINTER_VERSION}_linux_amd64.tar.gz

WORKDIR /app

CMD [ "lagoon-linter", "validate" ]

