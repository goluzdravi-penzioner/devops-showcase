<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apps"></a> [apps](#module\_apps) | ./modules/apps | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_redis"></a> [redis](#module\_redis) | ./modules/redis | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | n/a | `any` | n/a | yes |
| <a name="input_cidr_private_subnets"></a> [cidr\_private\_subnets](#input\_cidr\_private\_subnets) | n/a | `any` | n/a | yes |
| <a name="input_cidr_public_subnets"></a> [cidr\_public\_subnets](#input\_cidr\_public\_subnets) | n/a | `any` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | `"devopsbg"` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | n/a | `string` | `"1.30"` | no |
| <a name="input_rds_db_name"></a> [rds\_db\_name](#input\_rds\_db\_name) | n/a | `string` | n/a | yes |
| <a name="input_rds_db_username"></a> [rds\_db\_username](#input\_rds\_db\_username) | n/a | `string` | n/a | yes |
| <a name="input_rds_engine_version"></a> [rds\_engine\_version](#input\_rds\_engine\_version) | n/a | `string` | n/a | yes |
| <a name="input_rds_instance_class"></a> [rds\_instance\_class](#input\_rds\_instance\_class) | n/a | `string` | n/a | yes |
| <a name="input_rds_storage"></a> [rds\_storage](#input\_rds\_storage) | n/a | `number` | n/a | yes |
| <a name="input_redis_cluster_name"></a> [redis\_cluster\_name](#input\_redis\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_redis_engine_version"></a> [redis\_engine\_version](#input\_redis\_engine\_version) | n/a | `string` | n/a | yes |
| <a name="input_redis_node_type"></a> [redis\_node\_type](#input\_redis\_node\_type) | n/a | `string` | n/a | yes |
| <a name="input_redis_nodes"></a> [redis\_nodes](#input\_redis\_nodes) | n/a | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"eu-west-1"` | no |
| <a name="input_subnet_numbers"></a> [subnet\_numbers](#input\_subnet\_numbers) | n/a | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_api_endpoint"></a> [eks\_api\_endpoint](#output\_eks\_api\_endpoint) | n/a |
| <a name="output_k8s_cluster_info"></a> [k8s\_cluster\_info](#output\_k8s\_cluster\_info) | n/a |
| <a name="output_kubeconfig_certificate_authority_data"></a> [kubeconfig\_certificate\_authority\_data](#output\_kubeconfig\_certificate\_authority\_data) | n/a |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of private subnet ids |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of public subnet ids |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | VPC id |
<!-- END_TF_DOCS -->