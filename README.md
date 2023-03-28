# terraform-cloudfoundry-grafana-agent

Deploys a Grafana Agent to Cloud foundry

## Usages

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_cloudfoundry"></a> [cloudfoundry](#requirement\_cloudfoundry) | >= 0.50.5 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudfoundry"></a> [cloudfoundry](#provider\_cloudfoundry) | 0.50.5 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudfoundry_app.grafana_agent](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/app) | resource |
| [cloudfoundry_network_policy.grafana_agent](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/network_policy) | resource |
| [cloudfoundry_route.grafana_agent_internal](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/resources/route) | resource |
| [random_id.id](https://registry.terraform.io/providers/random/latest/docs/resources/id) | resource |
| [cloudfoundry_domain.domain](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/domain) | data source |
| [cloudfoundry_domain.internal](https://registry.terraform.io/providers/cloudfoundry-community/cloudfoundry/latest/docs/data-sources/domain) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cf_domain"></a> [cf\_domain](#input\_cf\_domain) | The CF domain to use for Grafana | `string` | n/a | yes |
| <a name="input_cf_space_id"></a> [cf\_space\_id](#input\_cf\_space\_id) | The CF Space to deploy in | `string` | n/a | yes |
| <a name="input_disk"></a> [disk](#input\_disk) | The amount of Disk space to allocate for Grafana Tempo (MB) | `number` | `4980` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment variables for Grafana Tempo | `map(any)` | `{}` | no |
| <a name="input_grafana_agent_image"></a> [grafana\_agent\_image](#input\_grafana\_agent\_image) | Tempo Docker image to use | `string` | `"grafana/agent:v0.32.1"` | no |
| <a name="input_memory"></a> [memory](#input\_memory) | The amount of RAM to allocate for Grafana (MB) | `number` | `512` | no |
| <a name="input_name_postfix"></a> [name\_postfix](#input\_name\_postfix) | The postfix string to append to the hostname, prevents namespace clashes | `string` | `""` | no |
| <a name="input_network_policies"></a> [network\_policies](#input\_network\_policies) | The container-to-container network policies to create with Grafana Agent as the destination app | <pre>list(object({<br>    source_app = string<br>    protocol   = string<br>    port       = string<br>  }))</pre> | `[]` | no |
| <a name="input_s3_broker_settings"></a> [s3\_broker\_settings](#input\_s3\_broker\_settings) | The S3 service broker to use | <pre>object({<br>    service_broker = string<br>    service_plan   = string<br>  })</pre> | <pre>{<br>  "service_broker": "hsdp-s3",<br>  "service_plan": "s3_bucket"<br>}</pre> | no |
| <a name="input_strategy"></a> [strategy](#input\_strategy) | The deployment strategy to use | `string` | `"rolling"` | no |
| <a name="input_tempo_host"></a> [tempo\_host](#input\_tempo\_host) | The Tempo host. | `string` | `"localhost:4317"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tempo_app_id"></a> [tempo\_app\_id](#output\_tempo\_app\_id) | The Tempo apps' id |
| <a name="output_tempo_internal_endpoint"></a> [tempo\_internal\_endpoint](#output\_tempo\_internal\_endpoint) | The internal endpoint where Tempo is reachable on |
| <a name="output_tempo_proxy_endpoint"></a> [tempo\_proxy\_endpoint](#output\_tempo\_proxy\_endpoint) | The endpoint where Tempo is reachable on |
| <a name="output_tempo_proxy_password"></a> [tempo\_proxy\_password](#output\_tempo\_proxy\_password) | The endpoint where Tempo is reachable on |
| <a name="output_tempo_proxy_username"></a> [tempo\_proxy\_username](#output\_tempo\_proxy\_username) | The endpoint where Tempo is reachable on |
<!-- END_TF_DOCS -->

## Contact / Getting help

Please post your questions on the HSDP Slack `#terraform` channel

## License

[License](./LICENSE.md) is MIT
