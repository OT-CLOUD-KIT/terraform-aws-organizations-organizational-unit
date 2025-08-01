output "level_1_org_unit_ids" {
  description = "Organizational Unit IDs for Level 1"
  value       = { for k, v in module.level_1.org_unit_id : k => v.id }
}

output "level_2_org_unit_ids" {
  description = "Organizational Unit IDs for Level 2"
  value       = { for k, v in module.level_2.org_unit_id : k => v.id }
}

output "level_3a_org_unit_ids" {
  description = "Organizational Unit IDs for Level 3a"
  value       = { for k, v in module.level_3a.org_unit_id : k => v.id }
}

output "level_3b_org_unit_ids" {
  description = "Organizational Unit IDs for Level 3b"
  value       = { for k, v in module.level_3b.org_unit_id : k => v.id }
}
