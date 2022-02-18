variable "listofname" {
  type        = list(string)
}
locals {
  res = [for s in var.listofname: upper(s)]
}

output "result"{
    value = local.res
}