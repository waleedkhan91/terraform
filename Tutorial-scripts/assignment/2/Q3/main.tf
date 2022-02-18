variable "listofno" {
  type        = list(number)
}
locals {
  clist = [for s in var.listofno : signum(s)]
}

output result {
  value       = local.clist 
}