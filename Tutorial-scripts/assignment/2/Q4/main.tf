variable "obj" {
  type = object({
      name = string
      age = number
  })
  validation{
    condition = var.obj.age > 18
    error_message = "Invalid age."
    }
}

output obj {
  value       = var.obj
}

