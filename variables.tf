variable "grafana_agent_image" {
  type        = string
  description = "Tempo Docker image to use"
  default     = "grafana/agent:v0.32.1"
}

variable "cf_space_id" {
  type        = string
  description = "The CF Space to deploy in"
}
variable "cf_domain" {
  type        = string
  description = "The CF domain to use for Grafana"
}
variable "name_postfix" {
  type        = string
  description = "The postfix string to append to the hostname, prevents namespace clashes"
  default     = ""
}
variable "environment" {
  type        = map(any)
  description = "Environment variables for Grafana Tempo"
  default     = {}
}

variable "s3_broker_settings" {
  type = object({
    service_broker = string
    service_plan   = string
  })
  default = {
    service_broker = "hsdp-s3"
    service_plan   = "s3_bucket"
  }
  description = "The S3 service broker to use"
}

variable "tempo_host" {
  description = "The Tempo host."
  type        = string
  default     = "localhost:4317"
}

variable "network_policies" {
  description = "The container-to-container network policies to create with Grafana Agent as the destination app"
  type = list(object({
    source_app = string
    protocol   = string
    port       = string
  }))
  default = []
}

variable "memory" {
  type        = number
  description = "The amount of RAM to allocate for Grafana (MB)"
  default     = 512
}

variable "disk" {
  type        = number
  description = "The amount of Disk space to allocate for Grafana Tempo (MB)"
  default     = 4980
}

variable "strategy" {
  type        = string
  description = "The deployment strategy to use"
  default     = "rolling"
}
