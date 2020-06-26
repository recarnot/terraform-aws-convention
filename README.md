# Module : terraform-aws-convention

<p align="left">
<a href="https://github.com/recarnot/terraform-aws-convention/"><img alt="Terraform version" src="https://img.shields.io/badge/Terraform-%3E%3D0.12-orange" /></a>
<a href="https://registry.terraform.io/modules/recarnot/terraform-aws-convention/github/"><img alt="Terraform registry" src="https://img.shields.io/github/v/release/recarnot/terraform-aws-convention" /></a>
<a href="https://github.com/recarnot/terraform-aws-convention/actions"><img alt="Plan check" src="https://github.com/recarnot/terraform-aws-convention/workflows/Plan%20check/badge.svg" /></a>
<a href="https://github.com/recarnot/terraform-aws-convention/actions"><img alt="Security check" src="https://github.com/recarnot/terraform-aws-convention/workflows/Security%20check/badge.svg" /></a>
<a href="https://registry.terraform.io/modules/recarnot/terraform-aws-convention/github/"><img alt="Terraform registry" src="https://img.shields.io/badge/Terraform-registry-blue" /></a>
</p>
This [**Terraform**](https://www.terraform.io/) module allow to manage naming conventions for your resources and retrieves useful informations about  **[AWS](https://aws.amazon.com/fr/console/)** context currently used.



## How to use

You can use this module with Terraform **OSS** or Terraform **Cloud**/**Enterprise**.

Just import the module and set variables :  

```typescript
module "convention" {
  source  = "recarnot//convention"
    
  context = "Projet alios"
  stage   = "poc"
  additional_tags = {
    owner : "Romain"
    cost_center : "c12345"
    business_unit : "R6"
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = merge(
    module.convention.tags,
    {
      Name : format(module.convention.label_formatter, "service-web")
    }
  )
}

output "prefix" {
    value = module.convention.prefix
}

output "az_names" {
    value = module.convention.availability_zones.names
}
```



## Required Inputs

These variables must be set in the module block when using this module.

| Name    | Description                                                  | Type   |
| ------- | ------------------------------------------------------------ | ------ |
| context | Configuration context like project's name, organization, abbreviation.. | string |
| stage   | Production, staging, UAT, Dev, ...                           | string |



## Optional Inputs

These variables have default values and don't have to be set to use this module. You may set these variables to override their default values.



| Name                     | Description                                     | Type        | Default              |
| ------------------------ | ----------------------------------------------- | ----------- | -------------------- |
| additional_tags          | Additional tags                                 | map(string) | {}                   |
| delimiter                | Delimiter to be used between `context`, `stage` | string      | -                    |
| default_management_value | Default value for management label              | string      | managed-by-terraform |



## Outputs

These properties are exposed as module output.

| Name               | Description                                                  | Type        |
| ------------------ | ------------------------------------------------------------ | ----------- |
| context            | Formatted `context` value without space or any special character | string      |
| stage              | Formatted `stage` value without space or any special character | string      |
| delimiter          | Delimiter used                                               | string      |
| prefix             | Concatenation between `context`, `stage`, `delimiter`, example `myproject-dev` | string      |
| label_formatter    | Allow to format string using `prefix`, example : format(module.convention.label_formatter, 'my-value') | string      |
| tags               | Created tags map                                             | map(string) |
| availability_zones | AWS Availability Zone informations                           | map(string) |
| account_id         | The AWS Account ID number of the account that owns or contains the calling entity | string      |
| region             | Current region informations                                  | map(string) |
| billing            | Informations about Billing account for that account that owns or contains the calling entity | map(string) |



#### tags

Without `additional_tags`

| Property   | Description                                                  | Type   |
| ---------- | ------------------------------------------------------------ | ------ |
| context    | Formatted `context` value without space or any special character | string |
| location   | Location of used region, example `europe`                    | string |
| management | Management label value, default `managed-by-terraform`       | string |
| region     | Current used region human readable name, example `irlande`   | string |
| stage      | Formatted `stage` value without space or any special character | string |



#### availability_zones

| Property | Description                         | Type         |
| -------- | ----------------------------------- | ------------ |
| count    | Number of AWS availability zones    | number       |
| names    | List of AWS availability zone names | list(string) |



#### region

| Property     | Description                                                | Type   |
| ------------ | ---------------------------------------------------------- | ------ |
| id           | Current used region name                                   | string |
| name         | Current used region human readable name, example `irlande` | string |
| location     | Location of used region, example `europe`                  | string |
| ec2_endpoint | The EC2 endpoint for the current used region               | string |



#### billing

| Property | Description                                | Type   |
| -------- | ------------------------------------------ | ------ |
| id       | The ID of the AWS billing service account  | string |
| arn      | The ARN of the AWS billing service account | string |



