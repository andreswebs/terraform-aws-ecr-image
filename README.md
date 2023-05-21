# terraform-aws-ecr-image

Creates an ECR repository and pushes a container image using local bash scripts.

## Pre-requisites

The following programs must be available on the `PATH` to be able to run the
local scripts:

- `bash`
- `docker`
- `aws`
- `find`
- `sort`
- `md5sum`

[//]: # (BEGIN_TF_DOCS)


## Usage

Example:

```hcl
module "ecr_image" {
  source            = "github.com/andreswebs/terraform-aws-ecr-image"
  ecr_namespace     = "yourorg"
  image_suffix      = "yourimage"
  image_source_path = "./your-image-code"
}
```

## Scripts

The [push.bash](scripts/push.bash) script uses `docker` by default to build and push the container image.

It is possible to use a different command, by setting the `DOCKER_CMD` environment variable before running the `terraform` commands.

Examples:

```sh
export DOCKER_CMD='podman'
terraform apply
```

```sh
export DOCKER_CMD=`lima nerdctl`
terraform apply
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_namespace"></a> [ecr\_namespace](#input\_ecr\_namespace) | (Optional) A namespace prefixed to the ECR repository name, e.g. 'my-namespace' in my-namespace/my-repo | `string` | `null` | no |
| <a name="input_hash_script"></a> [hash\_script](#input\_hash\_script) | (Optional) Path to a custom script to generate a hash of source contents | `string` | `""` | no |
| <a name="input_image_default_tag"></a> [image\_default\_tag](#input\_image\_default\_tag) | Default tag to use for the container image | `string` | `"latest"` | no |
| <a name="input_image_force_delete"></a> [image\_force\_delete](#input\_image\_force\_delete) | (Optional) Force delete image? | `bool` | `false` | no |
| <a name="input_image_source_path"></a> [image\_source\_path](#input\_image\_source\_path) | Path to the image source code | `string` | n/a | yes |
| <a name="input_image_suffix"></a> [image\_suffix](#input\_image\_suffix) | Suffix used to name the container image, e.g. 'my-repo' in my-namespace/my-repo | `string` | n/a | yes |
| <a name="input_image_tag_mutability"></a> [image\_tag\_mutability](#input\_image\_tag\_mutability) | Image tag immutability. Must be one of MUTABLE or IMMUTABLE | `string` | `"MUTABLE"` | no |
| <a name="input_lifecycle_policy"></a> [lifecycle\_policy](#input\_lifecycle\_policy) | Repository lifecycle policy. A default will be used if not provided | `string` | `null` | no |
| <a name="input_push_script"></a> [push\_script](#input\_push\_script) | (Optional) Path to a custom script to build and push the container image | `string` | `""` | no |
| <a name="input_scan_on_push"></a> [scan\_on\_push](#input\_scan\_on\_push) | Scan image on push? | `bool` | `true` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ecr_repository"></a> [ecr\_repository](#output\_ecr\_repository) | The AWS ECR Repository resource |
| <a name="output_image_hash"></a> [image\_hash](#output\_image\_hash) | Hash of the image source code, applied as a tag to the container image |
| <a name="output_image_uri"></a> [image\_uri](#output\_image\_uri) | Image URI |
| <a name="output_repository_url"></a> [repository\_url](#output\_repository\_url) | ECR repository URL |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.50 |
| <a name="provider_external"></a> [external](#provider\_external) | ~> 2.3 |
| <a name="provider_null"></a> [null](#provider\_null) | ~> 3.2 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.50 |
| <a name="requirement_external"></a> [external](#requirement\_external) | ~> 2.3 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2 |

## Resources

| Name | Type |
|------|------|
| [aws_ecr_lifecycle_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_lifecycle_policy) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [null_resource.push](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [external_external.hash](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) | data source |

[//]: # (END_TF_DOCS)

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).

## Acknowledgements

The code for pushing images to ECR (under `scripts/`) was based on:

<https://github.com/mathspace/terraform-aws-ecr-docker-image>
