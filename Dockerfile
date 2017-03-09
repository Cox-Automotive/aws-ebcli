# Docker file to run AWS EB CLI tools.
FROM alpine
MAINTAINER Antonelli, Kulinski

RUN apk --no-cache add \
	bash \
	less \
	groff \
	jq \
	git \
	python \
	curl \
	py-pip &&\
    pip install --upgrade \
	awsebcli \
	awscli

RUN curl -L https://github.com/barnybug/cli53/releases/download/0.8.7/cli53-linux-386 > /usr/bin/cli53 && \
    chmod +x /usr/bin/cli53

ENV PAGER=“less”

# Expose credentials volume
RUN mkdir ~/.aws
#VOLUME ["~/.aws"]

# Don't use an entrypoint or cmd at this time. This is intended to be used as a container in workflow steps
#ENTRYPOINT ["/usr/bin/eb"]
#CMD ["--version"]
