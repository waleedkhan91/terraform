variable "simpleMapExample" {
  type = map(any)
}

variable "mapExample" {
  type = map(object({
      cidr_block = string
      region = string
  }))
}
variable "simpleMapListObjectExample" {
  type = map(list(object({
      cidr_block = string
      region = string
  })))
}
output "simpleMapExample"{
    value = var.simpleMapExample
}
output "mapExample"{
    value = var.mapExample
}
output "simpleMapListObjectExample"{
    value = var.simpleMapListObjectExample
}