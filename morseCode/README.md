## MorseCode Serverless
Build a support Morse Code encode and decode service with [Serverless](https://github.com/serverless/serverless) and [AWS lambda](https://aws.amazon.com/lambda/).

### Steps
1. Install Serverless

```sh
npm install serverless -g
```
2. Install Gem Files

```sh
  bundle install --deployment
```
3. Deploy to AWS

create [IAM](https://serverless.com/framework/docs/providers/aws/guide/credentials#creating-aws-access-keys) user role and deploy to AWS.

```sh
serverless deploy
```
4. Fetch Functions Logs

```sh
serverless logs -f encode -t
```
Enjoy it.

### Resource

1. [Serverless - AWS Guide](https://serverless.com/framework/docs/providers/aws/guide/)
2. [Building AWS Lambdas for Real World using Ruby and Serverless Framework](https://dev.to/jalerson/building-aws-lambdas-for-real-world-using-ruby-and-serverless-framework-2p49)