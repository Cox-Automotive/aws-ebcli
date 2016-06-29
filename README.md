# AWS CLI and AWS EB CLI tools

Location on Docker Hub [`coxauto/awseb-cli`](https://hub.docker.com/r/coxauto/awseb-cli/)

A container for running AWS CLI and AWS EB CLI tools.

## Running - in a CLI

To run the cli tools, use the cli command just like you normally would.  The combination of -w and -v mounts your PWD into the container as the current working directory for the eb cli.

	docker run -i -w /work -v $PWD:/work coxauto/aws-ebcli eb --version
	
	docker run -i coxauto/aws-ebcli aws --version

	docker run -i -w /work -v $PWD:/work coxauto/aws-ebcli eb create test-app-${BUILD_NUMBER} 
	
	docker run -i coxauto/aws-ebcli aws ec2 describe-instances --region=us-east-1

To provide credentials, you have 2 options:

1. Use -e to export all your AWS creds env vars
2. Mount your ~/.aws directory to the docker container

Example with -e

	docker run -i -w /work -v $PWD:/work -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN coxauto/aws-ebcli eb status
	
	docker run -i -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN coxauto/aws-ebcli aws ec2 describe-instances --region=us-east-1

Example with mounting ~/.aws

	docker run -i -w /work -v $PWD:/work -v ~/.aws:/home/root/.aws coxauto/aws-ebcli eb status

## Running - via a Jenkinsfile

Use in a Jenkinsfile with docker workflow plugin:

```
docker.image('coxauto/aws-ebcli').inside('-u root:root') {
          sh 'eb create test-app-${BUILD_NUMBER}'
      }
```
