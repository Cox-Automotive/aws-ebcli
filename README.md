# AWS EB CLI tools

[`kulinski/awseb-cli`](https://hub.docker.com/r/kulinski/awseb-cli/)

A container for running AWS eb cli tools

## Running

To run the eb cli tools, pass arguments to the container that you would normally pass to the `eb` cmd.

    docker run kulinski/aws-ebcli --version

	docker run kulinski/aws-ebcli create test-app-${BUILD_NUMBER} 

