variable "vpc_id" {
    type = string
    default = "vpc-080d5f8268f541a99"
}
variable "region" {
    type = list(string)
    default = ["us-east-1", "us-west-1", "eu-east-1"]
}
variable "azs" {
    type = list(string)
    default = ["a", "b", "c", "d"]
}