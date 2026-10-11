variable "gke_hub_membership_iam_members" {
  description = <<EOT
Map of gke_hub_membership_iam_members, attributes below
Required:
    - member
    - membership_id
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member        = string
    membership_id = string
    role          = string
    location      = optional(string)
    project       = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

