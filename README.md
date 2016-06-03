# AWS EB CLI tools

[`kulinski/awseb-cli`](https://hub.docker.com/r/kulinski/awseb-cli/)

A container for running AWS eb cli tools

## Running

To run the eb cli tools, use the eb cli command just like you normally would

    docker run kulinski/aws-ebcli eb --version

	docker run kulinski/aws-ebcli eb create test-app-${BUILD_NUMBER} 

Or use in a Jenkinsfile with docker workflow plugin:

```
docker.image('kulinski/awseb-cli').inside('-u root:root') {
          sh 'eb create test-app-${BUILD_NUMBER}'
      }
```