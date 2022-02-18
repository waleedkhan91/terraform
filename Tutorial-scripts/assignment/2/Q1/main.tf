variable "a" {
  type = string
}
locals {
  b = var.a
  res = var.a == strrev(local.b) ? "It is a palindrome" : "Not a Palindrome."
}

output "final" {
  value       = "${var.a} == ${local.res}"
}

