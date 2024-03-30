.PHONY: deploy build destroy test
apigwid := $$(terraform output -raw apigateway_id)
test_url: 
	echo $(apigwid)
	curl -X POST "http://$(apigwid)/execute-api.localhost.localstack.cloud:4566/local/api?name=Localstack" 

	
deploy: build init plan apply

build:
	go get .
	GOOS=linux GOARCH=amd64 go build -o lambda
	zip lambda.zip lambda

init:
	terraform init

plan:
	AWS_PROFILE=localstack; terraform plan

apply:
	AWS_PROFILE=localstack; terraform apply -auto-approve

destroy:
	AWS_PROFILE=localstack; terraform destroy -auto-approve
	rm lambda
	rm lambda.zip
	rm -rf .terraform
	rm .terraform.lock.hcl 
	rm terraform.tfstate

test:
	echo "after lambda deployed please run below command to test the api endpoint\n"
	echo 'curl -X POST "http://{apigateway_id}.execute-api.localhost.localstack.cloud:4566/local/api?name=Localstack" -H "content-type: application/json"\n'
	echo "replace the apigateway_id with the correct one in the output message\n"
