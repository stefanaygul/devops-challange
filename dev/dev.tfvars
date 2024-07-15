objects = {
  kcls = {
    "container-svc1" = {
      size  = "small"
      count = 1
    }
    "container-svc2" = {
      size  = "small"
      count = 1
    }
  }
  rdb = {
    "mysql" = {
      size    = "xsmall"
      db_type = "mysql"
      count   = 1
    }
  }
  nsdb = {
    "nosql" = {
      size    = "xsmall"
      db_type = "nosql"
      count   = 1
    }
  }
  instance = {
    "wks" = {
      size  = "xsmall"
      count = 1
    }
  }
}

subenv_objects = {
  "natasha" = {
    kcls = {
      "container-svc1" = {
        size  = "xsmall"
        count = 1
      }
      "container-svc2" = {
        size  = "xsmall"
        count = 1
      }
    }
    rdb = {
      "mysql" = {
        size    = "xsmall"
        db_type = "mysql"
        count   = 1
      }
    }
    nsdb = {
      "nosql" = {
        size    = "xsmall"
        db_type = "nosql"
        count   = 1
      }
    }
    instance = {
      "wks" = {
        size  = "xsmall"
        count = 1
      }
    }
  }
  "clint" = {
    kcls = {
      "container-svc1" = {
        size  = "xsmall"
        count = 1
      }
      "container-svc2" = {
        size  = "xsmall"
        count = 1
      }
    }
    rdb = {
      "mysql" = {
        size    = "xsmall"
        db_type = "mysql"
        count   = 1
      }
    }
    nsdb = {
      "nosql" = {
        size    = "xsmall"
        db_type = "nosql"
        count   = 1
      }
    }
    instance = {
      "wks" = {
        size  = "xsmall"
        count = 1
      }
    }
  }
}
