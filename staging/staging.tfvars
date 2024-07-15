env     = "staging"
objects = {}
subenv_objects = {
  "integration" = {
    kcls = {
      "container-svc1" = {
        size  = "large"
        count = 2
      }
      "container-svc2" = {
        size  = "large"
        count = 2
      }
    }
    rdb = {
      "mysql" = {
        size    = "large"
        db_type = "mysql"
        count   = 1
      }
    }
    nsdb = {
      "nosql" = {
        size    = "large"
        db_type = "nosql"
        count   = 1
      }
    }
    instance = {
      "wks" = {
        size  = "large"
        count = 2
      }
    }
  }
  "performance" = {
    kcls = {
      "container-svc1" = {
        size  = "large"
        mem   = 2048
        count = 3
      }
      "container-svc2" = {
        size  = "large"
        mem   = 4096
        count = 3
      }
    }
    rdb = {
      "mysql" = {
        size    = "large"
        db_type = "mysql"
        count   = 1
      }
    }
    nsdb = {
      "nosql" = {
        size    = "large"
        db_type = "nosql"
        count   = 1
      }
    }
    instance = {
      "wks" = {
        size  = "large"
        count = 3
      }
    }
  }
}
