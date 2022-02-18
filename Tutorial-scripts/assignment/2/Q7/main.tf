variable "simpleMapListObjectExample" {
  type = map(set(object({
      cidr_block = string
      region = string
  })))
}
output "simpleMapListObjectExample"{
    value = var.simpleMapListObjectExample
}

variable "unstr" {
  type        = set(string)
}

output "result"{
    value = var.unstr
}