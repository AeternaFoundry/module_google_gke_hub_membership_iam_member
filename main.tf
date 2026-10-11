resource "google_gke_hub_membership_iam_member" "gke_hub_membership_iam_members" {
  for_each = var.gke_hub_membership_iam_members

  member        = each.value.member
  membership_id = each.value.membership_id
  role          = each.value.role
  location      = each.value.location
  project       = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

