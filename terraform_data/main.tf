locals {
  combined_objects = flatten(concat([
    for object_type, objects in var.objects : [
      for object_name, params in objects : [
        for i in range(0, lookup(params, "count", 1)) : {
          name        = "${var.env}-${object_type}-${object_name}-${format("%02d", i + 1)}"
          type        = object_type
          parent_name = lookup(params, "parent_name", null)
          size        = params.size
          db_type     = lookup(params, "db_type", null)
          mem         = lookup(params, "mem", null)
        }
      ]
    ]
    ], [
    for subenv, subenv_objects in var.subenv_objects : [
      for object_type, objects in subenv_objects : [
        for object_name, params in objects : [
          for i in range(0, lookup(params, "count", 1)) : {
            name        = "${var.env}-${subenv}-${object_type}-${object_name}-${format("%02d", i + 1)}"
            type        = object_type
            parent_name = lookup(params, "parent_name", null)
            size        = params.size
            db_type     = lookup(params, "db_type", null)
            mem         = lookup(params, "mem", null)
          }
        ]
      ]
    ]
  ]))
}

resource "terraform_data" "objects" {
  for_each = { for obj in local.combined_objects : obj.name => obj }

  input = {
    name        = each.value.name
    type        = each.value.type
    parent_name = each.value.parent_name
    size        = each.value.size
    db_type     = each.value.db_type
    mem         = each.value.mem
  }
}

output "name" {
  value = [for obj in terraform_data.objects : obj.input.name]
}
