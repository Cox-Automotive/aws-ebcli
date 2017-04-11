# Docker file to run AWS EB CLI tools.
FROM alpine
MAINTAINER Antonelli, Kulinski

RUN apk --no-cache add \
	bash \
	less \
	groff \
	jq \
	git \
	curl \
	python \
	py-pip \
	python-dev \
	build-base \
	libffi-dev \
	openssl-dev &&\
    pip install --upgrade pip \
	awsebcli \
	awscli \
	credstash

RUN curl -L https://github.com/barnybug/cli53/releases/download/0.8.7/cli53-linux-386 > /usr/bin/cli53 && \
    chmod +x /usr/bin/cli53

ENV PAGER="less"

# Expose credentials volume
RUN mkdir ~/.aws