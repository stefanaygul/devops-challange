env            = "prod"
subenv_objects = {}

objects = {
  kcls = {
    "container-svc1" = {
      size  = "xlarge"
      mem   = 2048
      count = 3
    }
    "container-svc2" = {
      size  = "xlarge"
      mem   = 4096
      count = 3
    }
  }
  rdb = {
    "mysql" = {
      size    = "xlarge"
      db_type = "mysql"
      count   = 1
    }
    "replica" = {
      size    = "xlarge"
      db_type = "mysql"
      count   = 1
    }
  }
  nsdb = {
    "nosql" = {
      size    = "xlarge"
      db_type = "nosql"
      count   = 1
    }
    "replica" = {
      size    = "xlarge"
      db_type = "nosql"
      count   = 1
    }
  }
  instance = {
    "wks" = {
      size  = "xlarge"
      count = 3
    }
  }
}
