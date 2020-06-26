# Module : terraform-aws-convention

<p align="left">
<a href="https://github.com/recarnot/terraform-aws-convention/"><img alt="Terraform version" src="https://img.shields.io/badge/Terraform-%3E%3D0.12-orange" /></a>
<a href="https://registry.terraform.io/modules/recarnot/terraform-aws-convention/github/"><img alt="Terraform registry" src="https://img.shields.io/github/v/release/recarnot/terraform-aws-convention" /></a>
<a href="https://github.com/recarnot/terraform-aws-convention/actions"><img alt="Plan check" src="https://github.com/recarnot/terraform-aws-convention/workflows/Plan%20check/badge.svg" /></a>
<a href="https://github.com/recarnot/terraform-aws-convention/actions"><img alt="Security check" src="https://github.com/recarnot/terraform-aws-convention/workflows/Security%20check/badge.svg" /></a>
<a href="https://registry.terraform.io/modules/recarnot/terraform-aws-convention/github/"><img alt="Terraform registry" src="https://img.shields.io/badge/Terraform-registry-blue" /></a>
</p>


This [**Terraform**](https://www.terraform.io/) module build a basic [**GitHub**](https://github.com/) repository to use **Terraform** **GitHub Actions** for Terraform **Cloud/Enterprise** for **[AWS](https://aws.amazon.com/fr/console/)** projects.

A **backend** to connect to **Terraform** Cloud/Enterprise state management is created.

Static security check can be added in workflow using GitHub Actions for [Checkov](https://www.checkov.io/) or [Bridgecrew](https://www.bridgecrew.cloud/) solutions.

Use : [terraform-github-cicd-bootstrap](https://registry.terraform.io/modules/recarnot/cicd-bootstrap/github/) module



## How to use

You can use this module with Terraform **OSS** or Terraform **Cloud**/**Enterprise** to create and configure your new GitHub repository.

Just import the module and set variables :  

```typescript
module "cicd_bootstrap_aws" {
  source = "recarnot/cicd-bootstrap-aws/github"

  github_token        = var.github_token
  github_organization = var.github_organization

  repository_name = var.project_name

  tf_organization = var.tf_organization
  tf_token        = var.secret_tfc_token
  tf_workspace    = var.project_name

  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  aws_region     = var.aws_region
}
```



Take a look at  [terraform-github-cicd-bootstrap](https://registry.terraform.io/modules/recarnot/cicd-bootstrap/github/) module documentation for more details.



## Managed resources

This module creates (in addition to the resources of the cicd-bootstrap module) :

- Variables for AWS credentials in Terraform workspace
- A *provider.tf* file with AWS Provider definition (using workspace variables)

