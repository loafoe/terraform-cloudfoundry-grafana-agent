output "grafana_agent_internal_endpoint" {
  description = "The internal endpoint where Grafana Agent is reachable on"
  value       = cloudfoundry_route.grafana_agent_internal.endpoint
}

output "grafana_agent_app_id" {
  description = "The Grafan Agent apps' id"
  value       = cloudfoundry_app.grafana_agent.id
}
