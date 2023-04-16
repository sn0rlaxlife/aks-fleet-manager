variable "location_one" {
    description     = "The location we are placing our first cluster and related resources under"
    type            = string
    default         = "eastus"
}

variable "location_two" {
    description     = "The second location we are placing the second cluster in"
    type            = string
    default         = "westus"
}

variable "agents_size" {
    default         = "Standard_a4_v2"
    description     = "The default virtual machine size for the Kubernetes agent - leaving"
    type            = string
}

variable "kubernetes_version" {
    description     = "Specify which kubernetes release to use, the default used is the latest kubernetes version"
    type            = string
    default         = null
}

