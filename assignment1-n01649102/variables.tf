variable "common_tags" {
  type = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "rajukumar.jha"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
