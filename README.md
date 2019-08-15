# aws-cli
Minimal docker image, with AWS CLI installed.  

Can be used to run commands from a CI environment against AWS.  

Will become obsolete as soon as there is an official AWS image: 
https://github.com/aws/aws-cli/issues/3553

## AWS configuration
You can either set the environment variables, or mount a credentials and a 
config file into the container.

### Environment variables
To properly use it, make sure to set the following environment variables
- `AWS_ACCESS_KEY_ID`: Specifies an AWS access key associated with an IAM user 
or role.
- `AWS_SECRET_ACCESS_KEY`: Specifies the secret key associated with the access 
key. This is essentially the "password" for the access key.
- `AWS_DEFAULT_REGION`: Specifies the AWS Region to send the request to.

### Config files
**Credentials**
Path: `~/.aws/credentials` 
Content:
```
[default]
aws_access_key_id=<REPLACE_ME>
aws_secret_access_key=<REPLACE_ME>
```
**Config**
Path: `~/.aws/config` 
Content:
```
[default]
region=us-west-2
output=json
```
