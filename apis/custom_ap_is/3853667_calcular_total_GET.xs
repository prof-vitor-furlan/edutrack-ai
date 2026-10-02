query calcular_total verb=GET {
  api_group = "CustomAPIs"

  input {
    int pedido_id? {
      table = "PEDIDO"
    }
  }

  stack {
    db.query ITEM {
      where = $db.ITEM.pedido_id == $input.pedido_id
      return = {type: "list"}
      output = ["valor_unit"]
    } as $ITEM1
  
    var $valor_total {
      value = 0
    }
  
    foreach ($ITEM1) {
      each as $item {
        var.update $valor_total {
          value = $var.valor_total+$var.item.subtotal
        }
      }
    }
  }

  response = $ITEM1
}