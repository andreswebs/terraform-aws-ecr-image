variable "ecr_namespace" {
  type        = string
  description = "(Optional) A namespace prefixed to the ECR repository name, e.g. 'my-namespace' in my-namespace/my-repo"
  default     = null
}

variable "image_suffix" {
  type        = string
  description = "Suffix used to name the container image, e.g. 'my-repo' in my-namespace/my-repo"
}

variable "image_default_tag" {
  type        = string
  description = "Default tag to use for the container image"
  default     = "latest"
}

variable "image_tag_mutability" {
  type        = string
  default     = "MUTABLE"
  description = "Image tag immutability. Must be one of MUTABLE or IMMUTABLE"

  validation {
    condition     = can(regex("^MUTABLE|IMMUTABLE$", var.image_tag_mutability))
    error_message = "Must be one of MUTABLE or IMMUTABLE."
  }

}

variable "scan_on_push" {
  type        = bool
  description = "Scan image on push?"
  default     = true
}

variable "lifecycle_policy" {
  type        = string
  description = "Repository lifecycle policy. A default will be used if not provided"
  default     = null
}

variable "hash_script" {
  type        = string
  description = "(Optional) Path to a custom script to generate a hash of source contents"
  default     = ""
}

variable "push_script" {
  type        = string
  description = "(Optional) Path to a custom script to build and push the container image"
  default     = ""
}

variable "image_source_path" {
  type        = string
  description = "Path to the image source code"
}

variable "image_force_delete" {
  type        = bool
  description = "(Optional) Force delete image?"
  default     = false
}
