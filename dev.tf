module "dev_firewal_policy" {
  source  = "terraform-google-modules/network/google//modules/hierarchical-firewall-policy"
  version = "~> 9.1"

  parent_node    = "folders/${var.dev_folder_id}"
  policy_name    = "dev-policy"
  description    = "Dev Firewall Policy"
  target_folders = [var.dev_folder_id]

  rules = [
    {
      priority       = "101"
      direction      = "EGRESS"
      action         = "deny"
      rule_name      = "egress-block-unwanted-web-sites"
      description    = "Block unwanted web sites"
      enable_logging = true
      match = {
        dest_fqdns = ["twitter.com"]
        dest_threat_intelligences = ["iplist-public-clouds"]
        layer4_configs = [
          {
            ip_protocol = "all"
          },
        ]
      }
    },
  ]
}
