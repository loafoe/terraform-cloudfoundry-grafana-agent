locals {
  postfix = var.name_postfix != "" ? var.name_postfix : random_id.id.hex

  command = "echo GRAFANA_AGENT_CONFIG_BASE64|base64 -d > /etc/agent/agent.yaml && /usr/bin/grafana-agent -config.file=/etc/agent/agent.yaml"

  grafana_agent_config = templatefile("${path.module}/templates/grafana-agent.yaml", {
    TEMPO_HOST = var.tempo_host
  })
}

resource "random_id" "id" {
  byte_length = 8
}

data "cloudfoundry_domain" "domain" {
  name = var.cf_domain
}

data "cloudfoundry_domain" "internal" {
  name = "apps.internal"
}

resource "cloudfoundry_app" "grafana_agent" {
  name         = "tf-grafana-agent-${local.postfix}"
  space        = var.cf_space_id
  memory       = var.memory
  disk_quota   = var.disk
  docker_image = var.grafana_agent_image
  environment = merge({
    GRAFANA_AGENT_CONFIG_BASE64 = base64encode(local.grafana_agent_config)
  }, var.environment)
  health_check_type = "process"
  strategy          = var.strategy

  //noinspection HCLUnknownBlockType
  routes {
    route = cloudfoundry_route.grafana_agent_internal.id
  }
}

resource "cloudfoundry_route" "grafana_agent_internal" {
  domain   = data.cloudfoundry_domain.internal.id
  space    = var.cf_space_id
  hostname = "tf-grafana-agent-${local.postfix}"
}

resource "cloudfoundry_network_policy" "grafana_agent" {
  count = length(var.network_policies) > 0 ? 1 : 0

  dynamic "policy" {
    for_each = [for p in var.network_policies : {
      //noinspection HILUnresolvedReference
      destination_app = p.destination_app
      //noinspection HILUnresolvedReference
      port = p.port
      //noinspection HILUnresolvedReference
      protocol = p.protocol
    }]
    content {
      destination_app = cloudfoundry_app.grafana_agent.id
      source_app      = policy.value.source_app
      protocol        = policy.value.protocol == "" ? "tcp" : policy.value.protocol
      port            = policy.value.port
    }
  }
}
