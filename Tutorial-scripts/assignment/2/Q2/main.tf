variable "listofno" {
  type        = list(number)
}

output result {
  value       = var.listofno[0] + var.listofno[1] 
}
