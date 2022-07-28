# codeartifact-example

## Preparation

1. replace `"your_aws_account_id"` with yours in `terraform/locals.tf`
1. replace `"region"` with the region you want to specify in `terraform/providers.tf`
1. replace `"codeartifact-repository-endpoint"` with yours in `*/build.gradle` in both app and lib project
1. set environment variables to authorize CodeArtifact

### CodeArtifact Repository Endpoint

```shell
https://{your_codeartifact_domain}-{aws_account_id}.d.codeartifact.{region}.amazonaws.com/maven/{library_name}/
```

### CodeArtifact Authorization Token

```shell
export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain {your_codeartifact_domain} --domain-owner {aws_account_id} --query authorizationToken --region {region} --output text --profile {profile}`
```

see https://docs.aws.amazon.com/codeartifact/latest/ug/maven-gradle.html#publishing-artifacts

## Creating CodeArtifact Repository

```shell
cd terraform
terraform apply
```

## Publishing the library

```shell
cd lib
./gradlew publish
```

## Fetching the library and use it

```shell
cd app
./gradlew bootRun
```
