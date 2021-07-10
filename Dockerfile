# Docker file to run AWS EB CLI tools.
FROM alpine

ENV PAGER="less"

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
        py3-setuptools \
        libc-dev \
        libffi \
        libffi-dev \
        openssl-dev \
        cargo \
        make \
        cmake \
        py3-pip

RUN pip3 install --upgrade pip \
        setuptools_rust \
        awsebcli --ignore-installed \
        awscli

RUN curl -L https://github.com/barnybug/cli53/releases/download/0.8.18/cli53-linux-386 > /usr/bin/cli53 && \
        chmod +x /usr/bin/cli53

# Expose credentials volume
RUN mkdir ~/.aws