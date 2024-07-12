module "org_firewal_policy" {
  source  = "terraform-google-modules/network/google//modules/hierarchical-firewall-policy"
  version = "~> 9.1"

  parent_node = "organizations/${var.organization_id}"
  policy_name = "org-policy"
  description = "Org Firewall Policy"
  target_org  = var.organization_id

  rules = [
    {
      priority       = "101"
      direction      = "INGRESS"
      action         = "allow"
      rule_name      = "allow-iap"
      description    = "Allow IAP"
      enable_logging = true
      match = {
        src_ip_ranges = ["35.235.240.0/20"]
        layer4_configs = [
          {
            ip_protocol = "tcp"
            ports       = ["22", "3389"]
          },
        ]
      }
    },
  ]
}
