locals {
  environments = {
    dev = {
      db_rdb = {
        size    = "xsmall"
        db_type = "mysql"
        count   = 1
      }
      db_nsdb = {
        size    = "xsmall"
        db_type = "nosql"
        count   = 1
      }
      instance_wks = {
        size  = "small"
        count = 1
      }
      k8s_cluster_kcsl = {
        size = "small"
        container_svc1 = {
          count = 1
        }
        container_svc2 = {
          count = 1
        }
      }

      natasha = {
        db_rdb = {
          size    = "xsmall"
          db_type = "mysql"
          count   = 1
        }
        db_nsdb = {
          size    = "xsmall"
          db_type = "nosql"
          count   = 1
        }
        instance_wks = {
          size  = "small"
          count = 1
        }
        k8s_cluster_kcsl = {
          size = "small"
          container_svc1 = {
            count = 1
          }
          container_svc2 = {
            count = 1
          }
        }
      }

      clint = {
        db_rdb = {
          size    = "xsmall"
          db_type = "mysql"
          count   = 1
        }
        db_nsdb = {
          size    = "xsmall"
          db_type = "nosql"
          count   = 1
        }
        instance_wks = {
          size  = "small"
          count = 1
        }
        k8s_cluster_kcsl = {
          size = "small"
          container_svc1 = {
            count = 1
          }
          container_svc2 = {
            count = 1
          }
        }
      }
    }

    staging = {
      integration = {
        db_rdb = {
          size    = "large"
          db_type = "mysql"
          count   = 2
        }
        db_nsdb = {
          size    = "large"
          db_type = "nosql"
          count   = 2
        }
        instance_wks = {
          size  = "large"
          count = 2
        }
        k8s_cluster_kcsl = {
          size = "large"
          container_svc1 = {
            count = 2
          }
          container_svc2 = {
            count = 2
          }
        }
      }

      performance = {
        db_rdb = {
          size    = "large"
          db_type = "mysql"
          count   = 3
        }
        db_nsdb = {
          size    = "large"
          db_type = "nosql"
          count   = 3
        }
        instance_wks = {
          size  = "xlarge"
          count = 3
        }
        k8s_cluster_kcsl = {
          size = "xlarge"
          container_svc1 = {
            count = 3
          }
          container_svc2 = {
            count = 3
          }
        }
      }
    }

    prod = {
      db_rdb = {
        size    = "xlarge"
        db_type = "mysql"
        count   = 3
      }
      db_nsdb = {
        size    = "xlarge"
        db_type = "nosql"
        count   = 3
      }
      db_rdb_replica = {
        size    = "xlarge"
        db_type = "mysql"
        count   = 3
      }
      db_nsdb_replica = {
        size    = "xlarge"
        db_type = "nosql"
        count   = 3
      }
      instance_wks = {
        size  = "xlarge"
        count = 3
      }
      k8s_cluster_kcsl = {
        size = "small"
        container_svc1 = {
          mem   = "2048"
          count = 3
        }
        container_svc2 = {
          mem   = "4096"
          count = 3
        }
      }
    }
  }

  # Helper to flatten nested maps into a list of maps with keys for env, subenv, and type
  flattened_envs = flatten([
    for env, env_map in local.environments : [
      for subenv, subenv_map in env_map : [
        for type, type_map in subenv_map : {
          env    = env
          subenv = subenv != "" ? subenv : null
          type   = type
          config = type_map
        }
      ]
    ]
  ])

  # Generate names according to the specified naming convention
  named_envs = [
    for item in local.flattened_envs : {
      name   = join("-", compact([item.env, replace(item.subenv, "_", "-"), replace(item.type, "_", "-")]))
      config = item.config
    }
  ]
}

resource "terraform_data" "some_object" {
  for_each = { for item in local.named_envs : item.name => item }

  input = {
    name   = each.key
    config = each.value.config
  }
}
