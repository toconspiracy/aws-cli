# aws-cli
Minimal docker image, with AWS CLI installed.  

Can be used to run commands from a CI environment against AWS.  

## Environment variables
To properly use it, make sure to set the following environment variables
- `AWS_ACCESS_KEY_ID`: Specifies an AWS access key associated with an IAM user or role.
- `AWS_SECRET_ACCESS_KEY`: Specifies the secret key associated with the access key. This is essentially the "password" for the access key.
- `AWS_DEFAULT_REGION`: Specifies the AWS Region to send the request to.
