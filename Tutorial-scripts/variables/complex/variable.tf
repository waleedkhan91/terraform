variable "objexample" {
  type = object({
      cidr_block = string
      region = string
  })
}

variable "mapofobjexample" {
  type = map(object({
      cidr_block = string
      region = string
  }))
}