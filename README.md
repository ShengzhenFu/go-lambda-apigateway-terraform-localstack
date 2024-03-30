# LocalStack Demo

Simple demo to provision Lambda (Golang) + APIGateway through Terraform and LocalStack

## Prerequisites

* LocalStack
* Docker
* AWS Cli
* Terraform


## Running LocalStack

Use the `localstack` CLI command to get started:
```
localstack start
```


## Deploy Lambda & APIGateway
```bash
make deploy
```

## Testing
replace the apigateway_id with the output in the Terraform
```bash
curl -X POST "http://{apigateway_id}.execute-api.localhost.localstack.cloud:4566/local/api?name=Localstack" -H "content-type: application/json"
```

