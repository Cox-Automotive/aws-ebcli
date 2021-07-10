# Docker file to run AWS EB CLI tools.
FROM alpine

RUN apk --no-cache --update add \
        bash \
        less \
        groff \
        jq \
        git \
        curl \
        gcc \
        musl-dev \
        python3-dev \
        libc-dev \
        libffi-dev \
        openssl-dev \
        cargo \
        make \
        cmake \
        py3-pip

RUN pip3 install --upgrade pip \
        setuptools_rust \
        awsebcli --ignore-installed --no-use-pep517 \
        awscli

RUN curl -L https://github.com/barnybug/cli53/releases/download/0.8.18/cli53-linux-386 > /usr/bin/cli53 && \
        chmod +x /usr/bin/cli53

ENV PAGER="less"

# Expose credentials volumeˇ
RUN mkdir ~/.aws
