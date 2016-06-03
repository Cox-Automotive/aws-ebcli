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

# Expose volume for adding credentials
#RUN mkdir ~/.aws
#VOLUME ["~/.aws"]

ENTRYPOINT ["/usr/bin/eb"]
#CMD ["--version"]