# Docker file to run AWS EB CLI tools.
FROM alpine
MAINTAINER Chris Kulinski

RUN apk --no-cache add \
	bash \
	less \
	groff \
	jq \
	git \
	python \
	py-pip &&\
    pip install --upgrade \
	awsebcli \
	awscli

ENV PAGER=“less”

# Expose credentials volume
RUN mkdir ~/.aws
#VOLUME ["~/.aws"]

# Don't use an entrypoint or cmd at this time. This is intended to be used as a container in workflow steps
#ENTRYPOINT ["/usr/bin/eb"]
#CMD ["--version"]
# Trigger build, kthxbye. :)
